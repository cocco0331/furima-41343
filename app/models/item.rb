class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_cost
  belongs_to :shipping_date
  belongs_to :delivery_region
  has_one_attached :image
  belongs_to :user

  validates :item_name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :category_id, :product_condition_id, :shipping_cost_id, :shipping_date_id, :delivery_region_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :image, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true },
                    presence: true
end
