# frozen_string_literal: true

class AddReferenceToWishlist < ActiveRecord::Migration[6.0]
  def change
    add_reference :wishlists, :user, null: false, foreign_key: true
    add_reference :wishlists, :product, null: false, foreign_key: true
  end
end
