class ProductsController < ApplicationController
	
	before_action :find_product , only: [:destroy,:show]
	#before_action :categories

	def categories
		@categories = Category.pluck(:category_type)
	end

	def new
		@categories_all = Category.all
		@product = Product.new
	
	end

	def create
		@product = Product.create(product_params)
		if @product.save
			redirect_to products_path
		else
			render "new"
		end
	end

	def index
		@products = current_supplier.products.page(params[:page]).per(10)
		render "product_show"
	end
		
	def destroy
		@product.destroy
		redirect_to products_path
	end

	def category
		@products = Product.includes(:category).where(categories: {category_type: params[:category_type]}).page(params[:page]).per(7)
		@categories = Category.pluck(:category_type)
		@min_price = Product.minimum(:price)
		@max_price = Product.maximum(:price) 
	end

	def show
		 # @product = Product.find(params[:id])
		 @order=Order.new
		  @reviews = Review.where(product_id: params[:product_id]).joins(:user)
	  @cart_action = @product.cart_action current_user.try :id
	end

	def brand
		@categories = Category.pluck(:category_type)
		@products = Product.where(brand: params[:brand_name]).page(params[:page]).per(7)
	end

	def price
		@categories = Category.pluck(:category_type)
		@min_price = Product.minimum(:price)
		@max_price = Product.maximum(:price) 
		@products = Product.where(price: (params[:min_price]..params[:mid_price])).includes(:category).where(categories: {category_type: params[:name]}).page(params[:page]).per(7)
	end

	private
	def find_product
		@product = Product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:name,:color,:category_id,:description,:brand,:stock,:status,:model,:price,:images,:size).merge(supplier_id: current_supplier.id)
	end

end
