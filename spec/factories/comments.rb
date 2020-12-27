FactoryBot.define do
  factory :comment do
    text {"コメントです"}
    association :user
    association :item
  end
end
