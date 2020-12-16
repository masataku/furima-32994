# テーブル設計

## users テーブル

| Column          | Type   | Option                    |
| --------------- | ------ | ------------------------- |
| nickname        | string | null: false               |
| email           | string | null: false, unique: true | 
| password        | string | null: false               |
| last_name       | string | null: false               |
| first_name      | string | null: false               |
| last_name_kana  | string | null: false               |
| first_name_kana | string | null: false               |

### Association
- has_many :items


## items テーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| image         | Active Storageで実装                         | 
| text          | text       | null: false                    |
| price         | integer    | null: false                    |
| category      | string     | null: false                    |
| state         | string     | null: false                    |
| shipping_fee  | string     | null: false                    |
| ship_from     | string     | null: false                    |
| shipping_date | string     | null: false                    |
| user          | references | foreign_key: true, null: false |

### Association
- belongs_to :user
- has_one :order


## orders テーブル

| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| number       | integer    | null: false                    |
| exp_month    | integer    | null: false                    | 
| cvc          | integer    | null: false                    |
| postal_code  | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_number | integer    | null: false                    |
| item         | references | foreign_key: true, null: false | 

### Association
- belongs_to :item