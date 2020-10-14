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
| birthday        | date   | null: false               |

### Association
has_many :items dependent: :destroy
has_one :purchase

## Items テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| item_name           | string  | null: false |
| info                | text    | null: false |
| price               | integer | null: false |
| category            | integer | null: false |
| sales_status        | integer | null: false |
| shopping_fee_status | integer | null: false |
| prefecture          | integer | null: false |
| scheduled_delivery  | integer | null: false |

### Association
belongs_to :user
has_one :purchase

## Addresses テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | integer | null: false |
| prefecture    | integer | null: false |
| city          | string  | null: false |
| house_number  | integer | null: false |
| building_name | string  |             |
| phone_number  | integer | null: false |

### Association
belongs_to :purchase


## Purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_kye: true |
| item    | references | null: false, foreign_kye: true |
| address | references | null: false, foreign_kye: true |

### Association
belongs_to :user
belongs_to :item
has_one :address