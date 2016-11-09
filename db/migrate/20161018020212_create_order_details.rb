class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :count

      t.timestamps
    end
  end
end
