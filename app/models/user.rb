class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products, through: :orders
  has_many :orders
  has_one :wishlist
  has_many :addresses
  has_many :reviews

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


  # rails_admin do
  #  # visible false
  #  user ||=User.new 
  #   unless user.admin?
  #   	visible false
  #   	end
  # end
end
