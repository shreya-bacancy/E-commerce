class Product < ApplicationRecord
	belongs_to :category 
	belongs_to :supplier
	
	has_many :orders
	has_many :users , through: :orders
	has_many_attached :images
	
	def cart_action(current_user_id)
	  if $redis.sismember "cart#{current_user_id}", id
	    "Remove from"
	  else
	    "Add to"
	  end
	end

	rails_admin do
		edit do
			include_all_fields
			field :images do
			end
		end
	end

	rails_admin do
		show do
		  include_all_fields
		  field :images do
		  end
  		end
	end
end
