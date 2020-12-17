class SearchController < ApplicationController
  def index
  	@products = Product.where("name Ilike ?", "%#{params[:query]}%").page(params[:page]).per(7)
  end
end
