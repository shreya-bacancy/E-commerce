# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    
    @categories = Category.pluck(:category_type)

  @products = Product.where('name Ilike ?', "%#{params[:q]}%").page(params[:page]).per(7)
    # if params[:q].nil?
    #  	@products = []
    #  else
    #   binding.pry
    #    @products = Product.search params[:q]
    #    puts "bbb#{@products} "
    #  end
   
  end

  def search_product
    # @products =Product.includes(:category).where(categories:{"category_type Ilike ?", "%#{params[:query]}%"})
     if params[:q].nil?
     	@products = []
     else
     	@products = Product.search params[:q]
     end
  # @products = Product.where('name Ilike ?', "%#{params[:query]}%").page(params[:page]).per(7)

    render 'supplier/search'
  end
end
