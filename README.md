# テーブル設計
## users テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | -----------                  |
| last_name        | string     | null: false                  |
| first_name       | string     | null: false                  |
| email            | string     | null: false                  |
| post_code        | string     | null: false                  |
| prefecture_id    | string     | null: false                  |
| city             | string     | null: false                  |
| street           | string     | null: false                  |
| business_name    | string     | null: false                  |
| profile          | string     | null: false                  |

### Association

* has_many :posts
* has_many :comments


## posts テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | -----------                  |
| description      | text       | null:false,foreign_key:true  |
| user             | references | null:false,foreign_key:true  |

### Association

- has_many :comments
- has_one :users

## comments テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | -----------                  |
| comment_tex      | string     | null: false                  |
| post             | references | null: false                  |
| user             | references | null: false                  |


### Association

- belongs_to :users
- has_one :posts
