# テーブル設計

## users テーブル

| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true | 
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| text             | text       | null: false                    |
| price            | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| state_id         | integer    | null: false                    |
| shipping_fee_id  | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| user             | references | foreign_key: true, null: false |

### Association
- belongs_to :user
- has_one :order


## orders テーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | foreign_key: true, null: false | 
| item   | references | foreign_key: true, null: false | 

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | foreign_key: true, null: false | 

### Association
- belongs_to :order


## comments テーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | foreign_key: true, null: false |
| item   | references | foreign_key: true, null: false |


### Association
- belongs_to :user
- belongs_to :item


## likes テーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | foreign_key: true, null: false |
| item   | references | foreign_key: true, null: false |


### Association
- belongs_to :user
- belongs_to :item