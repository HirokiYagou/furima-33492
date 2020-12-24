# テーブル設計

## users テーブル

| Column          | Type   | Options                       |
| --------------- | ------ | ----------------------------- |
| nickname        | string | null: false                   |
| email           | string | null: false                   |
| password        | string | null: false                   |
| last_name       | string | null: false                   |
| first_name      | string | null: false                   |
| last_name_kana  | string | null: false, format: [ァ- ヶ] |
| first_name_kana | string | null: false, format: [ァ- ヶ] |
| birthday        | date   | null: false                   |

### Association

- has_many :items
- has_many :purchase_infos

## items テーブル

| Column      | Type      | Options           |
| ----------- | --------- | ----------------- |
| name        | string    | null: false       |
| explanation | text      | null: false       |
| category    | string    | null: false       |
| condition   | string    | null: false       |
| price       | integer   | null: false       |
| cost        | string    | null: false       |
| area        | string    | null: false       |
| days        | string    | null: false       |
| user        | reference | foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase_info

## purchase_infos テーブル

| Column       | Type      | Options           |
| ------------ | --------- | ----------------- |
| card_number  | integer   | null: false       |
| card_limit   | data      | null: false       |
| card_sec_num | integer   | null: false       |
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
| prefecture    | string    | null: false              |
| city          | string    | null: false              |
| address       | string    | null: false              |
| building      | string    |                          |
| tel           | string    | null: false, format: \A0 |
| purchase_info | reference | foreign_key: true        |

### Association

- belongs_to :purchase_info