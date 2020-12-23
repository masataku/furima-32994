FactoryBot.define do
  factory :order_address do
    token         {"tk_aaaaaaaa0000000000"}
    postal_code   {"123-4567"}
    prefecture_id {2}
    city          {"青山市青山町"}
    address       {"青山1-2"}
    building      {"マンション"}
    phone_number  { "09012345678" }
    user_id       {2}
    item_id       {3}
  end
end
