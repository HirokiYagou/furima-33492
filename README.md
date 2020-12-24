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
- has_many :purchase_infos

## items テーブル

| Column       | Type      | Options           |
| ------------ | --------- | ----------------- |
| name         | string    | null: false       |
| explanation  | text      | null: false       |
| category_id  | integer   | null: false       |
| condition_id | integer   | null: false       |
| cost_id      | integer   | null: false       |
| area_id      | integer   | null: false       |
| days_id      | integer   | null: false       |
| price        | integer   | null: false       |
| user         | reference | foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase_info

## purchase_infos テーブル

| Column       | Type      | Options           |
| ------------ | --------- | ----------------- |
| item         | reference | foreign_key: true |
| user         | reference | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :shipping_data

## shipping_data テーブル

| Column        | Type      | Options                  |
| ------------- | --------- | ------------------------ |
| post          | string    | null: false              |
| prefecture_id | integer   | null: false              |
| city          | string    | null: false              |
| address       | string    | null: false              |
| building      | string    |                          |
| tel           | string    | null: false, format: \A0 |
| purchase_info | reference | foreign_key: true        |

### Association

- belongs_to :purchase_info