#!/bin/sh

source parse_yaml.sh
# site.yml を読み込んで、変数 $conf_ に代入
eval $(parse_yaml vccw/site.yml "conf_")

# site.yml をコピー。3-theme.sh, 3-plugin.sh で使用
cp vccw/site.yml ./

# vccw フォルダ名を変更して、1つ上の階層に移動
mv vccw ../$conf_hostname

# VCCW を起動
cd ../$conf_hostname
vagrant up

cd -