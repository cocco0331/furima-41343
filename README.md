# README

## usersテーブル

| Column              | Type   | Options                  |
| ------------------- | ------ | ------------------------ |
| email               | string | null: false unique: true |
| encrypted_password  | string | null: false              |
| nickname            | string | null: false              |
| last_name           | string | null: false              |
| first_name          | string | null: false              |
| last_name_kana      | string | null: false              |
| first_name_kana     | string | null: false              |
| birthday            | integer| null: false              |
### Association
has_many :items
has_many :orders

## itemsテーブル

| Column              | Type          | Options                  |
| ------------------- | ------        | ------------------------ |
| image               | ActiveStorage | null: false              |
| item_name           | string        | null: false              |
| description         | integer       | null: false              |
| category            | integer       | null: false              |
| product_condition   | integer       | null: false              |
| shipping_cost       | integer       | null: false              |
| delivery_region     | integer       | null: false              |
| birthday            | integer       | null: false              |
| price               | integer       | null: false              |
| users_id            | reference     | null: false foreign: true|

### Association

belongs_to :users
has_one :orders

## ordersテーブル

| Column              | Type          | Options                  |
| ------------------- | ------        | ------------------------ |
| items_id            | reference     | null: false foreign: true|
| users_id            | reference     | null: false foreign: true|

### Association

belongs_to :items
belongs_to :users
has_one : order_date

## order_datesテーブル

| Column              | Type          | Options                  |
| ------------------- | ------        | ------------------------ |
| post cord           | integer       | null: false              |
| prefectures         | string        | null: false              |
| address             | string        | null: false              |
| street_address      | string        | null: false              |
| building            | string        | null: false              |
| phone_number        | integer       | null: false              |
| phone_number        | integer       | null: false              |

### Association

belongs_to :orders