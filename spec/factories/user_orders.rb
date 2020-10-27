FactoryBot.define do
  factory :user_order do
    Faker::Config.locale = :ja
    postal_code { Faker::Address.zip_code }
    prefecture_id { Faker::Number.within(range: 2..48) }
    city { Faker::Address.city }
    house_number { Faker::Address.street_address }
    building_name { Faker::Address.street_name }
    phone_number { Faker::Number.number(digits: 11) }
    user_id { Faker::Number.within(range: 1..100) }
    item_id { Faker::Number.within(range: 1..100) }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
