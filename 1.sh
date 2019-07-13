#!/bin/sh

# VCCW をダウンロード
git clone https://github.com/vccw-team/vccw.git

# site.yml を開いて、編集する
cp vccw/provision/default.yml vccw/site.yml
vi vccw/site.yml