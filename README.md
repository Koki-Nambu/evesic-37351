# アプリケーション名  
EVESIC

# アプリケーション概要  
アーティストがイベントを主催し、まだ見ぬアーティストをブッキングする事でアーティストもお客さんも新規ファン、アーティストを獲得することができる。

# URL  
https://evesic-37351.herokuapp.com/

# テスト用アカウント  
・BASIC認証ID : test  
・BASIC認証 : 1111  
・メールアドレス : test@test.com  
・パスワード : 11111k  

# 利用方法  
1. トップページ(一覧ページ)からユーザー登録を行う。  
2. トップページ(一覧ページ)に表示されている「Post Event」からイベントの投稿を行う。  
3. トップページ(一覧ページ)に表示されているイベント詳細ページへ遷移し参加したいイベントを投稿したユーザー画面へ遷移し投稿者をフォローする。  
4. お互いにフォローし合う相手にのみマイページにメールアドレスが表示される。  



# アプリケーションを作成した背景	
アーティストがイベントをする際は知り合いのアーティストに出演してもらう事が多いが、
それを続けるとイベント出演者もお客さんもマンネリ化してきてしまい、新たなアーティスト、新たなファンに出会う機会が少なくなってしまう。  
そんな悩みを解決するためにこのアプリケーションを開発した。

# 洗い出した要件	
https://docs.google.com/spreadsheets/d/1K5snxME0m08IJvvBbpU9jBwi7pHznLGKHR5fNVUq-ks/edit?usp=sharing

# 実装した機能についての画像やGIFおよびその説明

・イベント一覧画面に閲覧数の多い上位3つの投稿を表示させる
![イベント一覧画面に閲覧数の多い上位3つの投稿を表示させる](https://gyazo.com/3d13c75794941ac0c3eecf4c721bcc14.gif)

・イベントのいいね&いいね解除機能
![イベントのいいね機能](https://gyazo.com/c8459b02cc1f3e3eb14be0a585735936.gif)

・ユーザーのフォロー&フォロー解除機能
![ユーザーのフォロー&フォロー解除機能](https://gyazo.com/e40773c08afe1fb62a0ff11591395297.gif)

・動画の埋め込み表示
![動画の埋め込み表示](https://gyazo.com/927da27dffc79fa1423eaf9b82b28840.gif)



# 実装予定の機能	
相互フォローになった際にのみメールアドレスで連絡を取れるが、アプリケーション上で全て完結できることが目標なので、DM機能を実装する予定。  
またコメント機能やイベント検索機能も実装予定

# データベース設計	
https://gyazo.com/b5aa2e386a8b1f3fc8edfed98c6cd695

# 画面遷移図
https://gyazo.com/8ffbe36ee5c413a2dcd38a0b9bc0e728

# 開発環境	
・Bootstrap v5.0.2  
・ruby 2.6.5p114  
・Heroku  
・Rspec-rails v4.0.0  
・VScode  
・Github プロジェクトボード  

# ローカルでの動作方法
% git clone https://github.com/Koki-Nambu/evesic-37351  
% cd evesic-37351  
% bundle install  
% yarn install  

# 工夫したポイント
トップページ(一覧ページ)の上部にHOU EVENTとして投稿されたイベントの中からアクセス数上位3つを表示するように実装。  
impressionistというGemを追加し、イベント詳細ページへ遷移した回数を計測する。その際自主的にPV数を伸ばす事が出来ないように、今回はip_addressにてPV数をカウントした。カウントデータをもとにデータを取得し、アクセス数の多い順に並べ替え出力した。  
またビューファイルには基本的にBootstrapを使用し、「シンプルで見やすい」を心がけてデザインした。






















# usersテーブル

| Column                 | Type       | Options                        |
| -----------------------| -----------| -------------------------------|
| nickname               | string     | null: false                    |
| artist_name            | string     | null: false                    |
| email                  | string     | null: false, unique: true      |
| encrypted_password     | string     | null: false                    |
| profile                | text       | null: false                    |
| url                    | string     |                                |
| genre_id               | integer    |                                |

### Association
has_many :events
has_many :comments
has_many :follows
has_many :likes






# eventsテーブル

| Column              | Type       | Options                        |
| --------------------| -----------| -------------------------------|
| title               | string     | null: false                    |
| date                | date       | null: false                    |
| place               | string     | null: false                    |
| charge              | integer    | null: false                    |
| content             | text       | null: false                    |
| user                | references | foreign_key: true              |
| impressions_count   | integer    | default: 0                     |

### Association
belongs_to :user
has_many :comments
has_many :likes
has_many :event_tag_relations





# commentsテーブル

| Column              | Type       | Options                        |
| --------------------| -----------| -------------------------------|
| text                | text       | null: false                    |
| event_id            | integer    | foreign_key: true              |
| user_id             | integer    | foreign_key: true              |


### Association
belongs_to :event
belongs_to :user





# FollowRelationsテーブル

| Column              | Type       | Options                        |
| --------------------| -----------| -------------------------------|
| user                | references | foreign_key: true, unique: true|
| follow              | references | foreign_key: true, unique: true|

### Association
belongs_to :user
belongs_to :follow, class_name: 'User'



# likesテーブル
| Column              | Type       | Options                        |
| --------------------| -----------| -------------------------------|
| event_id            | references | foreign_key: true              |
| user_id             | references | foreign_key: true              |

### Association
belongs_to :user
belongs_to :event




