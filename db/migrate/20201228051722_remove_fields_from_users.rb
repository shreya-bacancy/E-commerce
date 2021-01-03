# frozen_string_literal: true

class RemoveFieldsFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :address, :string
    remove_column :users, :city, :string
    remove_column :users, :pincode, :integer
    remove_column :users, :state, :string
  end
end
