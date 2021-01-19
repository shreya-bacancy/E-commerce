class AddVisitIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :visit_id, :integer
  end
end
