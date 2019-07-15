#!/bin/sh

read -p 'plugin slug?: ' SLUG

. parse_yaml.sh
eval $(parse_yaml ../site.yml "conf_")

# プラグイン ディレクトリ
DIR=../wordpress/wp-content/plugins/$SLUG
SRC=$DIR/src

# github reository
REPOSITORY=wp-plugin-dev-env

# src ディレクトリ作成
mkdir -p $SRC/scss $SRC/js
touch $SRC/scss/style.scss
touch $SRC/js/index.js

# wp-plugin-dev-env をインストール
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
