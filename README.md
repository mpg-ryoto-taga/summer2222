# Ruby on Rails チュートリアルのサンプルアプリケーション

これは、MedPeerインターンシップ用に作られた、次の教材で作られたサンプルアプリケーションです。

[*Ruby on Rails チュートリアル*](https://railstutorial.jp/)
（第6版）
[Michael Hartl](https://www.michaelhartl.com/) 著

## 使い方

このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。
その後、次のコマンドで環境構築を行います。

## 開発環境
### 事前準備
前提として、Dockerを使用した仮想環境を用いています。

まずは、ターミナルからDockerを使えるよう、事前にマシンにインストールをお願いします。
既にインストールしたことがある方については、スキップして進めていただいて構いません。

https://docs.docker.com/get-docker/

また、Dockerを使用している関係上各種コマンドがローカルのRuby/Railsを用いた際と比較して差異があります。
基本的には、Ruby/Railsコマンドの前に以下のコマンドを付与した上で実行すれば大丈夫です。

```
$ docker-compose run --rm web (bundle exec)
$ docker-compose run --rm web rails db:migrate # 例: DBのマイグレーション実行
$ docker-compose run --rm web bundle exec rake routes # 例: ルーティングの表示
```

以降の章を参考にして、アプリの起動やコマンドの実行を行ってください。

### 初回起動時
以下のコマンドを実行して、環境構築を行ってください。
Dockerコンテナの作成やgemのインストール、およびデータベースのマイグレーションが実行されます。

```
$ docker-compose build
$ docker-compose run --rm web bin/setup
```

### アプリケーションの起動
以下のコマンドを実行すると、Railsアプリケーションが起動し[http://localhost:3000/](http://localhost:3000/)にアクセスできます。

```
$ docker-compose up
```

### テストの実行

以下のコマンドでテストを実行できます。

```
$ docker-compose run --rm web rails test
```
## その他
何らかのバグを発見した場合、以下からissueを立ててもらえると幸いです。
確認後、重要度が高いものに関してはメンターが対応します。

https://github.com/medpeer-dev/rails_tutorial6/issues/new/choose
