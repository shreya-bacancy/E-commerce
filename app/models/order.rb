# frozen_string_literal: true

class Order < ApplicationRecord
 # belongs_to :product
  belongs_to :user
  visitable 
  has_many :order_details , dependent: :destroy
  has_many :products , through: :order_details
   def self.to_csv
   	 attributes = %w{user_name product order_time order_status}
   CSV.generate(headers: true) do |csv|
   csv << attributes
   all.each do |order|
     csv << attributes.map{ |attr| order.send(attr) }
   end
  end
end
end