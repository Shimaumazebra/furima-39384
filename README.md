## users テーブル

| Column          | Type    | Options     |
| --------------- | ------  | ----------- |
| name            | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| date_of_birth   | date    | null: false |


### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                | Type       | Options                            |
| --------------------- | ---------- | ---------------------------------- |
| user                  | references | null: false, foreign_key: true     |
| name                  | string     | null: false                        |
| description           | text       | null: false                        |
| price                 | integer    | null: false                        |
| category_id           | integer    | null: false                        |
| condition_id          | integer    | null: false                        |
| prefecture_id         | integer    | null: false                        |
| estimated_shipping_id | integer    | null: false                        |
| postage_fee_id        | integer    | null: false                        |

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
| post_code          | string     | null: false                        |
| prefecture_id      | integer    | null: false                        |
| city               | string     | null: false                        |
| building_name      | string     |                                    |
| phone_num          | integer    | null: false                        |

### Association

- belongs_to :purchases