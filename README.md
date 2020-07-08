# Best Your Title
このアプリは、求人広告のライター初心者や採用担当者が、
求人広告を書く際に「応募したい！」と思ってもらえるような
キャッチコピーを書けるよう、練習をするサイトです。

【URL】https://www.bestyourtitle.com/

※ゲストログイン機能から気軽に、全機能をお試し頂けます※

<img src="https://user-images.githubusercontent.com/63326271/86881167-d125f600-c128-11ea-9d43-195848ed8872.gif" width="60%">

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
