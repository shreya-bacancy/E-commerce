# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :find_product, only: %i[destroy show edit update]
  # before_action :categories

  def categories
    @categories = Category.pluck(:category_type)
  end

  def sort
    if params[:order] && params[:order] == "Ratings High to Low"
      @products=Product.includes(:category).where(categories: { category_type: params[:category_type] }).left_outer_joins(:reviews).order("reviews.rating DESC NULLS LAST")
    elsif params[:order] && params[:order] == "Ratings Low to High"
      @products=Product.includes(:category).where(categories: { category_type: params[:category_type] }).left_outer_joins(:reviews).order("reviews.rating")
    end
  end

  def new
    @categories_all = Category.all
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    # @product.images.variant(resize: "400x300^", crop: '400x300+0+0')
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def edit
    @categories_all = Category.all
  end

  def update
    @categories_all = Category.all
    if @product.update(product_params)
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def index
    @products = current_supplier.products.page(params[:page]).per(10)
    render 'product_show'
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  def category
    @products_count = Product.includes(:category).where(categories: { category_type: params[:category_type] }).count
    @products = Product.includes(:category).where(categories: { category_type: params[:category_type] }).page(params[:page]).per(7)
    @categories = Category.pluck(:category_type)
    @min_price = Product.minimum(:price)
    @max_price = Product.maximum(:price)
  end

  def show
    # @product = Product.find(params[:id])
    @order = Order.new
    @review = Review.where(product_id: params[:id]).joins(:user)
    @avg_rating = Review.where(product_id: params[:id]).average(:rating)
    @cart_action = @product.cart_action current_user.try :id
  end

  def brand
    @categories = Category.pluck(:category_type)
    @products = Product.where(brand: params[:brand]).includes(:category).where(categories: { category_type: params[:category] }).page(params[:page]).per(7)
  end

  def price
    @categories = Category.pluck(:category_type)
    @min_price = Product.minimum(:price)
    @max_price = Product.maximum(:price)
    @products = Product.where(price: (params[:min_price]..params[:mid_price])).includes(:category).where(categories: { category_type: params[:name] }).page(params[:page]).per(7)
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :color, :category_id, :description, :brand, :stock, :status, :model, :price, :images,
                                    :size).merge(supplier_id: current_supplier.id)
  end
end
