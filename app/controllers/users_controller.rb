# frozen_string_literal: true

class UsersController < ApplicationController
  # layout :home_layout, only: [:index]
 

  def index
    @categories = Category.pluck(:category_type)
    @wishlists = Wishlist.where(user_id: current_user)
    @wishlist_count = @wishlists.count
    render 'layouts/navigation/collapsible_links_partial_path'
  end

  def order
    @orders = current_user.orders
    #@products = current_user.orders.collect{|a| a.order_details}

    @products = current_user.order_details
    # @product_ids =  current_user.order_details.pluck(:product_id)
    # @product_images = Product.find(@product_ids)
   # @order = Product.where(id: @orders.pluck(:product_id)).joins(:orders).pluck("orders.order_status")

    render 'order_show'
  end

  private
  def home_layout
    current_supplier.present? ? 'application' : 'home'
  end
end
