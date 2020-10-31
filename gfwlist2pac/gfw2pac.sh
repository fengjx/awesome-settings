#!/usr/bin/env bash

# 覆盖下载
curl -O https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt

# 如果没有装 genpac，则先安装
if ! hash genpac 2>/dev/null; then 
  pip install -U genpac
fi

genpac --format=pac \
    --pac-proxy="SOCKS5 127.0.0.1:1080" \
    --gfwlist-local=~/gfwlist.txt \
    -o gfwlist.pac


