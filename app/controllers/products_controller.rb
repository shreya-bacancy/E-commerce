class ProductsController < ApplicationController
	

	def smartphone_index
		@products = Product.includes(:category).where(categories: {category_type: 'smartphones'}).page(params[:page]).per(7)
	end

	def show
		@product = Product.find(params[:id])
		 @cart_action = @product.cart_action current_user.try :id
	end

	def computer_index
		@products = Product.includes(:category).where(categories: {category_type: 'computer & laptop'}).page(params[:page]).per(7)
	end


	def camera_index
		@products = Product.includes(:category).where(categories: {category_type: 'camera & photos'}).page(params[:page]).per(7)
	end

	def tv_index
		@products = Product.includes(:category).where(categories: {category_type: 'tv & audio'}).page(params[:page]).per(7)		
	end

	# def show
 #  	@product = Product.find(params[:id])
 
	# end
end
