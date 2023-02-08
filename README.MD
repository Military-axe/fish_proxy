
# Fish Proxy Function

The Fish function script for Proxy.

Add the proxy command to fish, set the environment variable `$HTTP_PROXY` , `$ALL_PROXY`.

I write the script for wsl.

**For example**

```shell
~ # ❯❯❯ proxy show
host ip: 172.27.64.1
wsl ip : 172.27.79.214/20
proxy  : http://172.27.64.1:7890
```

## Install

Move the `proxy.fish` to `$HOME/.config/fish/function/`

## Useage

proxy [option]

option

+ set -- `set the environment variable`
+ unset -- `unset the environment variable`
+ show -- `show the ip information`
