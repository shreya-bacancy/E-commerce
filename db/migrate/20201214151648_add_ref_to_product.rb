# frozen_string_literal: true

class AddRefToProduct < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :supplier, null: false, foreign_key: true
  end
end
