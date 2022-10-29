FactoryBot.define do
  factory :order_form do
    post_code { '000-0000' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    address1 { Faker::Address.street_address }
    address2 { Faker::Address.secondary_address }
    phone_number { Faker::Number.number(digits: 11) }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
