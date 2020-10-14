# テーブル設計

## Users テーブル

| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| nickname        | string | null: false, unique: true |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| first_name      | string | null: false               |
| last_name       | string | null: false               |
| first_name_kana | string | null: false               |
| last_name_kana  | string | null: false               |
| birthday_id     | date   | null: false               |

### Association
has_many :items dependent: :destroy
has_many :purchases

## Items テーブル

| Column                 | Type    | Options     |
| ---------------------- | ------- | ----------- |
| name                   | string  | null: false |
| info                   | text    | null: false |
| price                  | integer | null: false |
| category_id            | integer | null: false |
| sales_status_id        | integer | null: false |
| shopping_fee_status_id | integer | null: false |
| prefecture_id          | integer | null: false |
| scheduled_delivery_id  | integer | null: false |

### Association
belongs_to :user
has_one :purchase

## Addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| purchase         | references | null: false, foreign_kye: true |

### Association
belongs_to :purchase


## Purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_kye: true |
| item    | references | null: false, foreign_kye: true |

### Association
belongs_to :user
belongs_to :item
has_one :address