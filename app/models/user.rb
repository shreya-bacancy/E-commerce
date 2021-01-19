# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products, through: :orders
  has_many :orders
  has_many :order_details , through: :orders
  has_one :wishlist
  has_many :addresses
  has_many :reviews
  has_many :events, class_name: "Ahoy::Event"
  has_many :visits, class_name: "Ahoy::Visit"
  def cart_count
    $redis.scard "cart#{id}"
  end

  def total_price
    cart_ids = $redis.smembers "cart#{id}"
    @cart_products = Product.find(cart_ids)
    @cart_total_price = 0
    @cart_products.each do |product|
      @cart_total_price += product.price
    end
    @cart_total_price
  end

  def soft_delete
    update_attribute(:deleted_at, Time.current)
  end

  # ensure user account is active
  def active_for_authentication?
    super && !deleted_at
  end

  # provide a custom message for a deleted account
  def inactive_message
    !deleted_at ? super : :deleted_account
  end
end
