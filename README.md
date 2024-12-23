# README

## usersテーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------  |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| nickname            | string | null: false               |
| last_name           | string | null: false               |
| first_name          | string | null: false               |
| last_name_kana      | string | null: false               |
| first_name_kana     | string | null: false               |
| birthday            | date   | null: false               |
### Association
has_many :items
has_many :orders

## itemsテーブル

| Column              | Type          | Options                       |
| ------------------- | ------        | ------------------------      |
| item_name           | string        | null: false                   |
| description         | text          | null: false                   |
| category_id         | integer       | null: false                   |
| product_condition_id| integer       | null: false                   |
| shipping_cost_id    | integer       | null: false                   |
| shipping_date_id    | integer       | null: false                   |
| delivery_region_id  | integer       | null: false                   |
| price               | integer       | null: false                   |
| user                | references    | null: false, foreign_key: true|

### Association

belongs_to :user
has_one :order

## ordersテーブル

| Column              | Type       | Options                       |
| ------------------- | ------     | ------------------------      |
| item                | references | null: false, foreign_key: true|
| user                | references | null: false, foreign_key: true|

### Association

belongs_to :item
belongs_to :user
has_one : order_date

## order_datesテーブル
| Column              | Type          | Options                        | 
| ------------------- | ------        | ------------------------       |
| post_cord           | string        | null: false                    |
| shipping_date_id    | integer       | null: false                    |
| address             | string        | null: false                    |
| street_address      | string        | null: false                    |
| building            | string        |                                |
| phone_number        | string        | null: false                    |
| order               | references    | null: false, foreign_key: true |

### Association

belongs_to :order