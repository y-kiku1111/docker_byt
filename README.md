# Best Your Title
このアプリは、求人広告のライター初心者や採用担当者が、
求人広告を書く際に「応募したい！」と思ってもらえるような
キャッチコピーを書けるよう、練習をするサイトです。

[リンク]:https://www.bestyourtitle.com/
※ゲストログイン機能から気軽にお試し頂けます※

![0807b84593e579d5e9515addd31381f5](https://user-images.githubusercontent.com/63326271/86881167-d125f600-c128-11ea-9d43-195848ed8872.gif)


# 特に見ていただきたい点(インフラ面)
- Dockerを使い、ECS(FARGATE)/ECRで本番環境をサーバーレスで運用している点。
- AWSを使い、ALBを通すことで常時SSL通信を行っている点。

# 機能一覧:

## ユーザー
- 認証機能
- 簡単ログイン機能
- マイページ機能
- プロフィール編集機能

## 投稿機能
- 投稿一覧
- 投稿検索
- 投稿編集
- 投稿削除
- コメント機能
- いいね機能
- ページネーション

## その他
- ページ遷移(loading)ビュー
- 新着順、ランキング順での一覧

# 使用技術一覧:
- Sass(scss)
- Hmal
- HTML/CSS
- Javascript / jQuery

## 開発環境
- Docker/docker-compose
- ruby 2.5.0
- Rails 5.2.3

## インフラ構成
- AWS(ECS(FARGATE)/ECR/ELB/Route53/ACM/RDS)
- Nginx, unicorn
- CircleCIによる自動デプロイ

## テスト(実装予定)
- rubocop
- Rspec(単体、結合テスト) 
- CircleCI

## テーブル設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
### Association
has_many :comments
has_many :catch_copies
has_many :likes
has_many :likes_catch_copies, through: :likes

## catch_copiesテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|target|string|null: false|
|job_category|text|
|image|text|
|user_id|references|null: false,foreign_key: true|"
### Association
belongs_to :user
has_many :likes
has_many :users, through: :likes
has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false,foreign_key: true|
|catch_copy_id|references|null: false,foreign_key: true|
### Association
belongs_to :user
belongs_to :catch_copy

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|catch_copy_id|references|null: false,foreign_key: true|
### Association
belongs_to :user
belongs_to :catch_copy
