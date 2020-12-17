class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def cart_count
    $redis.scard "cart#{id}"
  end

  # rails_admin do
  #  # visible false
  #  user ||=User.new 
  #   unless user.admin?
  #   	visible false
  #   	end
  # end
end
