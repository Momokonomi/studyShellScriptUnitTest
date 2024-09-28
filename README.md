# はじめに

今回使わせていただく`shunit2`の git リポジトリ：
https://github.com/kward/shunit2

# 概要

`shunit2`でシェルスクリプトの単体テストを試行するリポジトリ。

作成したシェルスクリプトは`exe.sh`と`test.sh`2 つ

`exe.sh`は 1 つの引数をとり、その引数の名前のフォルダを作成する

`test.sh`は`exe.sh`のテストを実行するスクリプト

## 環境構築

test.sh の動作を確認したい場合、以下の順にコマンドを実行することで確認できる

1. git clone で本リポジトリをローカルマシンにダウンロードする
2. docker コンテナを作成する
   exe.sh や test.sh が存在するディレクトリで以下のコマンドを実行する

```shell
cd ./.devcontainer
docker compose up
```

3. コンテナに入る

```shell
docker container exec --interactive --tty shellTest bash
```

4. test.sh を実行する

```shell
./test.sh
```

このような実行結果が得られる

```shell
devuser@c77f0f316287:~/src$ ./test.sh
testCanMkdir
testDirAlreadyExist
mkdir: cannot create directory 'testFolder': File exists

Ran 2 tests.

OK
```
