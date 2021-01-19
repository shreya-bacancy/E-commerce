# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      # t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      # t.integer :quantity , default: 1
    
      t.timestamps
    end
  end
end
