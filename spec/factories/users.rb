FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { "1a" + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { '流川' }
    first_name { '楓' }
    last_name_kana { 'ルカワ' }
    first_name_kana { 'カエデ' }
    birthday { '1999-01-01' }
  end
end
