FactoryBot.define do
  factory :item do
    name { Faker::Lorem.word }
    explanation { Faker::Lorem.paragraph }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    shipping_charges_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    days_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9999999) }
    # user_id { FactoryBot.build(:user)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/IMG_8806.jpg'), filename: 'IMG_8806.jpg')
    end
  end
end
