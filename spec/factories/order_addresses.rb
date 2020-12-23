FactoryBot.define do
  factory :order_address do
    token         {"tk_aaaaaaaa0000000000"}
    postal_code   {"123-4567"}
    prefecture_id {2}
    city          {"青山市青山町"}
    address       {"青山1-2"}
    phone_number  {012345678912}
  end
end
