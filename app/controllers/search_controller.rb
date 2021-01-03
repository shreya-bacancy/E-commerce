# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @categories = Category.pluck(:category_type)
    @products = Product.where('name Ilike ?', "%#{params[:query]}%").page(params[:page]).per(7)
  end

  def search_product
    # @products =Product.includes(:category).where(categories:{"category_type Ilike ?", "%#{params[:query]}%"})
    @products = Product.where('name Ilike ?', "%#{params[:query]}%").page(params[:page]).per(7)
    render 'supplier/search'
  end
end
