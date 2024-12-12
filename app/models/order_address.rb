class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_date_id, :address, :street_address, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }

    validates :address
    validates :street_address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
  end
  validates :shipping_date_id, numericality: { other_than: 0, message: "can't be blank" }
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    OrderDate.create(post_code: post_code, shipping_date_id: shipping_date_id, address: address, street_address: street_address,
                     building: building, phone_number: phone_number, order_id: order.id)
  end
end
