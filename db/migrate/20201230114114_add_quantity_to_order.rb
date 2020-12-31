class AddQuantityToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :quantity, :integer
    add_column :orders, :order_total, :integer
  end
end
