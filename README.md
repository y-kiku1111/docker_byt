# Best Your Title
このアプリは、より共感できるキャッチコピー(タイトル)」を投稿し、
他の方にコメントやいいね(共感)され、キャッチコピーセンスを上げる事を
目的としたアプリです。

![toukyoutop](https://user-images.githubusercontent.com/63326271/85952012-8cb88e80-b9a1-11ea-8d18-50c334dc1e61.png)
![f823687e57e552392a9c81293762ba4c](https://user-images.githubusercontent.com/63326271/85952162-61826f00-b9a2-11ea-9eae-2e9b4a790f7e.jpg)

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

# 使用技術一覧:
- Sass(scss)
- Hmal
- HTML/CSS
- Javascript / jQuery

## 開発環境
- Dcoker
- ruby 2.5.0
- Rails 5.2.3

# 今後について
現在開発途中のため、下記内容を順次
実装していきます。

## インフラの構成
デプロイ後は、下記内容にて構成予定となります。
- CircleCIによる自動デプロイ
- AWS(EC2、RDS、ELB、Route53、ACM、S3を予定)
- Nginx, unicorn

## テスト
- rubocop
- Rspec(単体、結合テスト) 
- CircleCI

## 機能の追加、拡張
- いいねランキングの実装
- 投稿ページの画像投稿機能を強化
など

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
