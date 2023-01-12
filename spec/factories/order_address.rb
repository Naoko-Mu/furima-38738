FactoryBot.define do
  factory :order_address do
    zip_code { '123-4567' }
    state_id { 2 }
    city { 'さいたま市' }
    street_address { '1-1-1' }
    building_name { 'しまじろう' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
