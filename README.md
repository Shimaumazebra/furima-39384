## users テーブル

| Column        | Type    | Options     |
| ------------- | ------  | ----------- |
| name          | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| last_name     | string  | null: false |
| first_name    | string  | null: false |
| date_of_birth | integer | null: false |


### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column             | Type       | Options                            |
| ------------------ | ---------- | ---------------------------------- |
| user               | references | null: false, foreign_key: true     |
| name               | string     | null: false                        |
| images             | string     | null: false                        |
| description        | text       | null: false                        |
| price              | integer    | null: false                        |
| category           | integer    | null: false                        |
| condition          | integer    | null: false                        |
| prefecture         | integer    | null: false                        |
| estimated_shipping | integer    | null: false                        |
| postage_fee        | integer    | null: false                        |

### Association

- belongs_to : users
- has_one    : purchases

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## purchase_info テーブル

| Column             | Type       | Options                            |
| ------------------ | ---------- | ---------------------------------- |
| purchase           | references | null: false, foreign_key: true     |
| post_code          | integer    | null: false                        |
| prefecture         | string     | null: false                        |
| city               | string     | null: false                        |
| building_name      | string     | null: false                        |
| phone_num          | integer    | null: false                        |

### Association

- belongs_to :purchases