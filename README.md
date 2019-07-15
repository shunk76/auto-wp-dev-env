# auto-wp-dev-env

VCCW でのテーマ・プラグイン構築環境を作る。
VCCW をダウンロード、site.yml の編集、VCCW を起動、SASS, Babel, Browser-sync 環境までを自動化。

## Install
```
git clone git@github.com:shunk76/auto-wp-dev-env.git
```

## VCCW をダウンロードするところから始める
### theme を開発
```
$ cd auto-wp-dev-env/bin
$ . up.sh
Which do you develop a theme or plugin ?: theme
```
1. VCCW をダウンロード
2. site.yml を編集する
3. site.yml の編集が終わると、VCCW が起動される
```
theme slug?: example
```
localhost が立ち上がる。

### plugin を開発
```
$ cd auto-wp-dev-env/bin
$ . up.sh
Which do you develop a theme or plugin ?: plugin
```
1. VCCW をダウンロード
2. site.yml を編集する
3. site.yml の編集が終わると、VCCW が起動される

```
plugin slug?: example
```
localhost が立ち上がる。

## すでに VCCW をダウンロード済み
すでに、example.test ディレクトリに VCCW がインストールされていて、

### theme を開発
```
$ cd example.test
$ vagrant up
$ . bin/theme.sh
theme slug?: sample-theme
```
localhost が立ち上がる。

### plugin を開発
```
$ cd example.test
$ vagrant up
$ . bin/plugin.sh
plugin slug?: sample-plugin
```
localhost が立ち上がる。


