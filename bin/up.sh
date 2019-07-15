#!/bin/sh

# . up.sh で実行

read -p 'Which do you develop a theme or plugin ?:' TYPE

while [ $TYPE != theme ] && [ $TYPE != plugin ]
do
  echo 'theme か plugin を指定してください。'
  read -p 'theme or plugin ?:' TYPE
done

# VCCW をダウンロード
git clone https://github.com/vccw-team/vccw.git

# site.yml を開いて、編集する
cp vccw/provision/default.yml vccw/site.yml
vi vccw/site.yml

# site.yml を読み込んで、変数 $conf_ に代入
. parse_yaml.sh
eval $(parse_yaml vccw/site.yml "conf_")

# vccw フォルダ名を変更して、1つ上の階層に移動
mv vccw ../$conf_hostname

# theme.sh, plugin.sh を $conf_hostname/bin にコピー
cp theme.sh plugin.sh parse_yaml.sh ../$conf_hostname/bin/

# VCCW を起動
cd ../$conf_hostname
vagrant up

# テーマ開発の場合
if [ $TYPE = theme ]; then
  . bin/theme.sh
fi

# プラグイン開発の場合
if [ $TYPE = plugin ]; then
  . bin/plugin.sh
fi