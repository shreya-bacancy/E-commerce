# frozen_string_literal: true

class AddFieldsToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :brand, :string
    add_column :products, :memoryStorage, :string
    add_column :products, :operatingSystem, :string
  end
end
