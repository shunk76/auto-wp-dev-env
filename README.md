# auto-wp-dev-env

## VCCW をダウンロードするところから始める
### theme を開発
```
$ cd bin
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
$ cd bin
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
(example.test ディレクトリに VCCW がインストールされている)

### theme を開発
```
$ cd example.test
$ vagrant up
$ . bin/theme.sh
theme slug?: sample-theme
```

### plugin を開発
```
$ cd example.test
$ vagrant up
$ . bin/plugin.sh
plugin slug?: sample-plugin
```


