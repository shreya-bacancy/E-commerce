# frozen_string_literal: true

class AddReferenceToProduct < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :category, null: false, foreign_key: true
  end
end
