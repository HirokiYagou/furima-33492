# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |

### Association

- has_one  :profile
- has_many :items
- has_many :purchase-info, through :user_purchase
- has_many :user_purchases

## profile テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| last_name       | string     | null: false |
| first_name      | string     | null: false |
| last_name_kana  | string     | null: false, katakanadake! |
| first_name_kana | string     | null: false, katakanadake! |
| birth_year      | integer    | null: false |
| birth_month     | integer    | null: false |
| birth_day       | integer    | null: false |
| user            | reference  |             |

### Association

- belongs_to :user

## items テーブル

| Column      | Type      | Options     |
| ----------- | --------- | ----------- |
| name        | string    | null: false |
| explanation | text      | null: false |
| category    | string    | null: false |
| condition   | string    | null: false |
| price       | integer   | null: false |
| user        | reference |             |

### Association

- belongs_to :user
- has_one :ship
- has_one :purchase_info

## ships テーブル

| Column | Type      | Options     |
| ------ | --------- | ----------- |
| cost   | string    | null: false |
| area   | string    | null: false |
| days   | string    | null: false |
| item   | reference |             |


### Association

- belongs_to :item

## purchase_infos テーブル

| Column | Type      | Options     |
| ------ | --------- | ----------- |
| item   | reference |             |

### Association

- belongs_to :item
- has_many :users, through :user_purchases
- has_many :user_purchases
- has_one :card
- has_one :delivery_source

## cards テーブル

| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| number        | integer   | null: false |
| limit_year    | integer   | null: false |
| limit_month   | integer   | null: false |
| security_num  | integer   | null: false |
| purchase_info | reference |             |

### Association

- belongs_to :purchase_info

## delivery_sources テーブル

| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| post          | string    | null: false |
| prefecture    | string    | null: false |
| city          | string    | null: false |
| address       | integer   | null: false |
| building      | string    |             |
| tel           | integer   | null: false |
| purchase_info | reference |             |

### Association

- belongs_to :purchase_info

## user_purchases テーブル

 Column         | Type      | Options |
| ------------- | --------- | ------- |
| user          | reference |         |
| purchase_info | reference |         |

### Association

- belongs_to :user
- belongs_to :purchase_info