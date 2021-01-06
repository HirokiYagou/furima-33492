# テーブル設計

## users テーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| nickname           | string | null: false                   |
| email              | string | null: false                   |
| encrypted_password | string | null: false                   |
| last_name          | string | null: false                   |
| first_name         | string | null: false                   |
| last_name_kana     | string | null: false, format: [ァ- ヶ] |
| first_name_kana    | string | null: false, format: [ァ- ヶ] |
| birthday           | date   | null: false                   |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column       | Type      | Options           |
| ------------ | --------- | ----------------- |
| name         | string    | null: false       |
| explanation  | text      | null: false       |
| category_id  | integer   | null: false       |
| condition_id | integer   | null: false       |
| cost_id      | integer   | null: false       |
| area_id      | integer   | null: false       |
| day_id       | integer   | null: false       |
| price        | integer   | null: false       |
| user         | reference | foreign_key: true |

### Association

- belongs_to :user
- has_one    :order
- has_many   :items_categories
- has_many   :categories, through: :items_categories

## categories テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| tag    | string | null: false |

### Association

- has_many :items_categories
- has_many :items, through: :items_categories

## items_categories テーブル

| Column | Type      | Options           |
| ------ | --------- | ----------------- |
| item | reference | foreign_key: true |
| category | reference | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :category

## orders テーブル

| Column       | Type      | Options           |
| ------------ | --------- | ----------------- |
| item         | reference | foreign_key: true |
| user         | reference | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :shipping

## shippings テーブル

| Column        | Type      | Options                  |
| ------------- | --------- | ------------------------ |
| post          | string    | null: false              |
| area_id       | integer   | null: false              |
| city          | string    | null: false              |
| address       | string    | null: false              |
| building      | string    |                          |
| tel           | string    | null: false, format: \A0 |
| order         | reference | foreign_key: true        |

### Association

- belongs_to :order