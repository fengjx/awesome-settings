#!/bin/sh

git filter-branch --env-filter '

# 之前的邮箱
OLD_EMAIL="gzfengjianxin@corp.netease.com"
# 修改后的用户名
CORRECT_NAME="fengjx"
# 修改后的邮箱
CORRECT_EMAIL="fengjianxin2012@gmail.com"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
