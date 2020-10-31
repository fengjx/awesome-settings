export BASE_DIR := $(shell pwd)
OR_EXEC ?= $(shell which openresty)
LUAROCKS_VER ?= $(shell luarocks --version | grep -E -o  "luarocks [0-9]+.")

.PHONY: default

_github:
	@git config user.name "FengJianxin"
	@git config user.email "fengjianxin2012@gmail.com"
	@git add .
	@git commit -m "[$(LANG=C date)] auto update"
	@git push origin main

_gfw2pac: 
	@cd gfwlist2pac && sh gfw2pac.sh

### gfw2pac:				sync gfwlist.txt and gfwlist.pac
gfw2pac: _gfw2pac _github


### help:				Makefile帮助
.PHONY: help
help:
	@echo Makefile cmd:
	@echo
	@grep -E '^### [-A-Za-z0-9_]+:' Makefile | sed 's/###/   /'

