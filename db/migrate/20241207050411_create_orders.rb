class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :item,    nill: false, foreign_key: true
      t.references :user,    nill: false, foreign_key: true
      t.timestamps
    end
  end
end
