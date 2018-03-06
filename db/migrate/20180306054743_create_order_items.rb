class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :quantity
      t.decimal :total_line_price, precision: 15, scale: 2

      t.timestamps null: false
    end
  end
end
