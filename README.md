

## usersテーブル

| Column                 | Type       | Options                        |
| -----------------------| -----------| -------------------------------|
| nickname               | string     | null: false                    |
| artist_name            | string     | null: false                    |
| email                  | string     | null: false, unique: true      |
| encrypted_password     | string     | null: false                    |
| profile                | text       | null: false                    |
| url                    | string     |                                |
| genre_id1              | integer    |                                |
| genre_id2              | integer    |                                |
| genre_id3              | integer    |                                |
| genre_id4              | integer    |                                |
| genre_id5              | integer    |                                |

### Association
has_many :events
has_many :comments
has_many :follows
has_many :likes






## eventsテーブル

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





## commentsテーブル

| Column              | Type       | Options                        |
| --------------------| -----------| -------------------------------|
| text                | text       | null: false                    |
| event_id            | integer    | foreign_key: true              |
| user_id             | integer    | foreign_key: true              |


### Association
belongs_to :event
belongs_to :user





## FollowRelationsテーブル

| Column              | Type       | Options                        |
| --------------------| -----------| -------------------------------|
| user                | references | foreign_key: true, unique: true|
| follow              | references | foreign_key: true, unique: true|

### Association
belongs_to :user
belongs_to :follow, class_name: 'User'



## likesテーブル
| Column              | Type       | Options                        |
| --------------------| -----------| -------------------------------|
| event_id            | references | foreign_key: true              |
| user_id             | references | foreign_key: true              |

### Association
belongs_to :user
belongs_to :event