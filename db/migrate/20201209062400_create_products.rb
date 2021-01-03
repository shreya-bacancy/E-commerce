# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :color
      t.string :size
      t.string :sold_by
      t.integer :stock
      t.boolean :status
      t.integer :discount, default: 0
      t.string :model
      t.integer :model_year
      t.string :display_technology
      t.string :resolution
      t.string :connector_type
      t.timestamps
    end
  end
end
