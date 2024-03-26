# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| password           | string  | null: false               |
| confirm_password   | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birth              | integer | null: false               |

### Association

- has_many :items
- has_many :orders
- has_many :deliverys

## items テーブル

| Column       | Type       | Options                        |
| -----------  | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| info         | text       | null: false                    |
| category     | string     | null: false                    |
| sales_stats  | string     | null: false                    |
| shipping     | string     | null: false                    |
| area         | string     | null: false                    |
| delivery     | string     | null: false                    |
| price        | integer    | null: false                    |
| listing_user | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- has_many   :deliverys
- belongs_to :user
- belongs_to :order

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| buy_item  | string     | null: false                    |
| buy_user  | string     | null: false,                   |
| user      | references | null: false, foreign_key: true |

### Association

- has_many   :deliverys
- belongs_to :user
- belongs_to :item

## deliverys テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false,                   |
| city         | string     | null: false,                   |
| address      | string     | null: false,                   |
| building     | string     | null: false,                   |
| phone_number | string     | null: false,                   |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :order
