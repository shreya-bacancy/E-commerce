class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.string :name
      t.integer :price
      t.string :color
      t.string :size
      t.integer :discount, default: 0
      t.integer :quantity , default: 1
      t.integer :total 
      t.date :delivery_date , default: Date.today
      t.boolean :order_status , default: 0
      t.timestamps
    end
  end
end
