FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    shipping_date_id { '2' }
    address { ' 福岡 ' }
    street_address { ' 1-1' }
    building { '福岡ハイツ' }
    phone_number { '08012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
