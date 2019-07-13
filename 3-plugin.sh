#!/bin/sh

# sh 3.sh [plugin slug]で実行

source parse_yaml.sh
eval $(parse_yaml site.yml "conf_")

# プラグイン ディレクトリ
DIR=../$conf_hostname/wordpress/wp-content/plugins/$1

# github reository
REPOSITORY=wp-plugin-dev-env

# src ディレクトリ作成
mkdir -p $DIR/src/scss $DIR/src/js

# wp-plugin-dev-env をインストール
cd $DIR
git clone git@github.com:shunk76/$REPOSITORY.git
cp $REPOSITORY/* ./
rm -rf $REPOSITORY

# gulpfile.js に proxy を設定
sed -i '' -e "s/proxy: ''/proxy: '$conf_hostname'/" gulpfile.js

# site.yml を削除
rm -f site.yml

#npm-check-updates
ncu -u

# package をインストール
npm i
