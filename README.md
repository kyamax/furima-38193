# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

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



## テーブル
|column            |type       |option                        |
|------------------|-----------|------------------------------|

### Association


## テーブル
|column            |type       |option                        |
|------------------|-----------|------------------------------|

### Association


