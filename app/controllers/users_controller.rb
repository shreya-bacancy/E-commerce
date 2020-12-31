class UsersController < ApplicationController
  layout :home_layout, only: [:index]
  def index
  	@categories = Category.pluck(:category_type)
  		@wishlists = Wishlist.where(user_id:current_user)
		@wishlist_count = @wishlists.count
  	render 'layouts/navigation/collapsible_links_partial_path'
  end

  def order
    
  	@orders = Order.where(user_id: current_user.id)
    #@order_id = Order.find(params[:id])
  	@products = Product.where(id: @orders.pluck(:product_id))
  	render "order_show"
  end

  private
  def home_layout
  	current_supplier.present? ? "application" : "home"
  end



end
