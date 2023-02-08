#!/usr/bin/env fish
function proxy
    set hostip (cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
    set wslip (ip -c addr show eth0 | grep "inet " | awk '{print $2}')
    set port 7890

    set PROXY_HTTP "http://$hostip:$port"
    set PROXY_SOCKS "socks5://$hostip:$port"

    
    if test $argv[1] = "set"
        set -Ux http_proxy $PROXY_HTTP
        set -Ux HTTP_PROXY $PROXY_HTTP

        set -Ux https_proxy $PROXY_HTTP
        set -Ux HTTPS_PROXY $PROXY_HTTP

        set -Ux ALL_PROXY $PROXY_HTTP

        git config --global http.https://github.com.proxy $PROXY_HTTP
        git config --global https.https://github.com.proxy $PROXY_HTTP
        echo "Proxy has been opened."

    else if test $argv[1] = "unset"
        set -u http_proxy
        set -u HTTP_PROXY
        set -u https_proxy
        set -u HTTPS_PROXY
        set -u ALL_PROXY
        git config --global --unset http.https://github.com.proxy
        git config --global --unset https.https://github.com.proxy
        echo "Proxy has been closed."
    
    else if test $argv[1] = "show"
        echo "host ip: $hostip"
        echo "wsl ip : $wslip"
        echo "proxy  : $PROXY_HTTP"

    else
        echo "wrong arguments $argv[1]"
    end
end