# frozen_string_literal: true

class CreateProductsWishlists < ActiveRecord::Migration[6.0]
  def change
    create_table :products_wishlists do |t|
      t.references :wishlist, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
    end
  end
end
