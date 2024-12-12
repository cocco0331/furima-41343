class CreateOrderDates < ActiveRecord::Migration[7.0]
  def change
    create_table :order_dates do |t|
      t.string     :post_code,        nill: false
      t.integer    :shipping_date_id, nill: false
      t.string     :address,          nill: false
      t.string     :street_address,   nill: false
      t.string     :building
      t.string     :phone_number,     nill: false
      t.references :order,            nill: false, foreign_key: true
      t.timestamps
    end
  end
end
