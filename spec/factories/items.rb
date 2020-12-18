FactoryBot.define do
  factory :item do
    name             {Faker::Name.initials(number: 5)}
    text             {Faker::Lorem.sentence}
    price            {"500"}
    category_id      {"2"}
    state_id         {"2"}
    shipping_fee_id  {"2"}
    prefecture_id    {"2"}
    shipping_date_id {"2"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpg'), filename: "test.jpg")
    end  
  end
end
