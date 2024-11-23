FactoryBot.define do
  factory :item do
    association :user
    item_name { 'テスト商品' }
    description { 'テスト商品説明' }
    category_id { 2 }
    product_condition_id { 2 }
    shipping_cost_id { 2 }
    shipping_date_id { 2 }
    delivery_region_id { 2 }
    price { 300 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
