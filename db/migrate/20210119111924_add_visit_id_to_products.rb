class AddVisitIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :visit_id, :integer
  end
end
