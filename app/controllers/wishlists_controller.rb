class WishlistsController < ApplicationController
  
  def index
		@wishlists = Wishlist.where(user_id:current_user)
		@wishlist_count = @wishlists.count
	end

	def new
		Wishlist.new
	end

  def show
  	@wishlists = Wishlist.where(user_id:current_user)
  	@user_wishlist = Product.joins(wishlists: :user).page(params[:page]).per(7)
  	@categories = Category.pluck(:category_type)
  end


	def create
		@wishlist= Wishlist.find_by(user_id:current_user.id)
		if Wishlist.find_by(user_id:current_user.id)
		else
			@wishlist = Wishlist.create(user_id:current_user.id,product_id:params[:product_id])
		end
		# if @wishlist.save
		@product_id = Product.find(params[:product_id])
		@wishlist.products<<@product_id
	
	end

	def destroy
		@wishlist= Wishlist.find_by(user_id:current_user.id)
		@product_id = Product.find(params[:product_id])
		#binding.pry
		if @wishlist.products.include?(@product_id)
			@wishlist.products.limit(1).destroy(@product_id)
		end
		redirect_to @wishlist
	end

end
