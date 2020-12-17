class CartsController < ApplicationController
	before_action :authenticate_user!
  
	def show
		cart_ids = $redis.smembers current_user_cart
		@cart_products = Product.find(cart_ids)
		@cart_total_price = 0
		@cart_products.each do |product|
			@cart_total_price += product.price
		end
		
	end

	def add
		$redis.sadd current_user_cart, params[:product_id]
		redirect_to action: "show"
		# render json: current_user.cart_count, status: 200
	end

	def remove
		$redis.srem current_user_cart, params[:product_id]
		redirect_to action: "show"
		# render json: current_user.cart_count, status: 200
	end

	private

	def current_user_cart
		"cart#{current_user.id}"
	end

end
