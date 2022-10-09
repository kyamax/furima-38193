# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
_6.0.0_

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル(devise)
|column            |type   |option                                |
|------------------|-------|--------------------------------------|
|nickname          |string |null: false                           |
|email             |string |null: false, default: "", unique: true|
|encrypted_password|string |null: false, default: ""              |
|last_name         |string |null: false                           |
|first_name        |string |null: false                           |
|last_name_kana    |string |null: false                           |
|first_name_kana   |string |null: false                           |
|birthday          |date   |null: false                           |

### Association
has_many :items
has_many :orders


## itemsテーブル
|column             |type       |option                        |
|-------------------|-----------|------------------------------|
|name               |string     |null: false                   |
|explanation        |text       |null: false                   |
|category_id        |integer    |null: false                   |
|condition_id       |integer    |null: false                   |
|shipping_charges_id|integer    |null: false                   |
|prefecture_id      |integer    |null: false                   |
|days_id            |integer    |null: false                   |
|price              |integer    |null: false                   |
|user               |references |null: false, foreign_key: true|

### Association
belongs_to :user
has_one :order


## ordersテーブル
|column            |type       |option                        |
|------------------|-----------|------------------------------|
|user              |references |null: false, foreign_key: true|
|item              |references |null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :address


## addressテーブル
|column            |type       |option                        |
|------------------|-----------|------------------------------|
|post_code         |string     |null: false                   |
|prefecture_id     |integer    |null: false                   |
|city              |string     |null: false                   |
|address1          |string     |null: false                   |
|address2          |string     |                              |
|phone_number      |string     |null: false                   |
|order             |references |null: false, foreign_key: true|

### Association
belongs_to :order