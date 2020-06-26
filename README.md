## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
### Association
has_many :comments
has_many :likes, dependent: :destroy
has_many :like_catch_copies, through: :likes, source: :catch_copy

## catch_copiesテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|target|string|null: false|
|job_category|text|
|image|text|
|user_id|references|null: false,foreign_key: true|"
### Association
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

