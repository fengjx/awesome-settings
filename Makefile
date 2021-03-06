
.PHONY: default

_github:
	@git config user.name "FengJianxin"
	@git config user.email "fengjianxin2012@gmail.com"
	@git remote set-url origin https://${GH_TOKEN}@github.com/fengjx/awesome-settings.git
	@git add .
	@git commit -m "auto update"
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

