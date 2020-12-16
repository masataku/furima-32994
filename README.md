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
- has_one :address
- has_many :items, through: :orders 


## items テーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| text          | text       | null: false                    |
| price         | integer    | null: false                    |
| category_id   | integer    | null: false                    |
| state         | string     | null: false                    |
| shipping_fee  | string     | null: false                    |
| ship_from     | string     | null: false                    |
| shipping_date | string     | null: false                    |
| user          | references | foreign_key: true, null: false |

### Association
- belongs_to :user
- has_one :user, through: :orders


## orders テーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | foreign_key: true, null: false | 
| item   | references | foreign_key: true, null: false | 

### Association
- belongs_to :user
- belongs_to :item


## addresses テーブル

| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| user         | references | foreign_key: true, null: false | 

### Association
- belongs_to :user