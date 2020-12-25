class CategoriesController < ApplicationController

	before_action :find_category , only: [:destroy,:edit,:update]
  def new
  	@category = Category.new
  end

  def create
  	@category = Category.create(category_params)
  	if @category.save
  		redirect_to categories_path
  	else
  		render "new"
  	end
  end

  def edit
  end

  def update
		if @category.update(category_params)
			redirect_to categories_path
		else
			render 'edit'
		end
  end

  def index
  	@categories = Category.all
  end

  def destroy
  	@category.destroy
		redirect_to categories_path
  end

  private
  def find_category
  	@category = Category.find(params[:id])
  end

  def category_params
  	params.require(:category).permit(:category_type)
  end
end
