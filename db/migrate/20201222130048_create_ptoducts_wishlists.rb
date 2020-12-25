class CreatePtoductsWishlists < ActiveRecord::Migration[6.0]
  def change
    create_table :ptoducts_wishlists do |t|
      t.references :wishlist, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
    end
  end
end
