FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 4)}
    email                 {Faker::Internet.free_email}
    password              {"12345a"}
    password_confirmation {password}
    birthday              {"2020-01-01"}
    last_name             {"あ阿ア"}
    first_name            {"い井イ"}
    last_name_kana        {"アイウ"}
    first_name_kana       {"カキク"}
  end
end