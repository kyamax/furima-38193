FactoryBot.define do
  factory :order do
    user_id { Faker::Number.number(digits: 2) }
    item_id { Faker::Number.number(digits: 2) }
  end
end
