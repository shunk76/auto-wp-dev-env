#!/bin/sh

source parse_yaml.sh
eval $(parse_yaml site.yml "conf_")

# テーマ ディレクトリ
DIR=../$conf_hostname/wordpress/wp-content/themes/$conf_hostname

# github reository
REPOSITORY=wp-theme-dev-env

# src ディレクトリ作成
mkdir -p $DIR/resources/src/scss $DIR/resources/src/js

# wp-theme-dev-env をインストール
cd $DIR
git clone git@github.com:shunk76/$REPOSITORY.git
cp $REPOSITORY/* ./
rm -rf $REPOSITORY

# site.yml を削除
rm -f site.yml

#npm-check-updates
ncu -u

# package をインストール
npm i
