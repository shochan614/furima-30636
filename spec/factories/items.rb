FactoryBot.define do
  factory :item do
    Faker::Config.locale = :ja
    name { Faker::Creature::Animal.name }
    info { Faker::Lorem.sentence }
    category_id { Faker::Number.within(range: 2..11) }
    sales_status_id { Faker::Number.within(range: 2..7) }
    shopping_fee_status_id { Faker::Number.within(range: 2..3) }
    prefecture_id { Faker::Number.within(range: 2..48) }
    scheduled_delivery_id { Faker::Number.within(range: 2..4) }
    price { Faker::Number.within(range: 300..9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
