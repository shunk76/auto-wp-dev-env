#!/bin/sh

read -p 'theme slug?: ' SLUG

. parse_yaml.sh
eval $(parse_yaml ../site.yml "conf_")

# テーマ ディレクトリ
DIR=../wordpress/wp-content/themes/$SLUG
SRC=$DIR/resources/src

# github reository
REPOSITORY=wp-theme-dev-env

# src ディレクトリ作成
mkdir -p $SRC/scss $SRC/js
touch $SRC/scss/style.scss
touch $SRC/js/index.js

# wp-theme-dev-env をインストール
cd $DIR
git clone git@github.com:shunk76/$REPOSITORY.git
cp $REPOSITORY/* ./
rm -rf $REPOSITORY

# gulpfile.js に proxy を設定
sed -i '' -e "s/proxy: ''/proxy: '$conf_hostname'/" gulpfile.js

#npm-check-updates
if [ -z $(which ncu) ]; then
  # ncu コマンドが存在しないとき
  read -p 'npm-check-updates をインストールしますか?(y/N)' ANS

  if [ $ANS = y ]; then
    sudo npm i -g npm-check-updates
    ncu -u
  fi
else 
  ncu -u
fi

# package をインストール
npm i

npm start
