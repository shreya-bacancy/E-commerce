# frozen_string_literal: true 
class WishlistsController < ApplicationController

  before_action :authenticate_user!  
  def index
    @wishlist = current_user.wishlist
    @wishlist_count = @wishlists.count
  end

  def new
    Wishlist.new
  end

  def show
    @wishlist = current_user.wishlist
    @user_wishlist = Product.joins(wishlists: :user).page(params[:page]).per(7)
    @categories = Category.pluck(:category_type)
  end

  def create
    @wishlist = current_user.wishlist
    if @wishlist
    else
      @wishlist = current_user.wishlist.create(product_id: params[:product_id])
    end
    # if @wishlist.save
    @product_id = Product.find(params[:product_id])

    @wishlist.products << @product_id unless @wishlist.products.include?(@product_id)
  end

  def destroy
    @wishlist = current_user.wishlist
    @product_id = Product.find(params[:product_id])
    # binding.pry

    @wishlist.products.destroy(@product_id) if @wishlist.products.include?(@product_id)
    redirect_to @wishlist
  end
end
