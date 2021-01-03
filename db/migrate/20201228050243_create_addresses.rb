# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :state
      t.integer :pincode
      t.string :city
      t.string :address
      t.string :area

      t.timestamps
    end
  end
end
