class UsersController < ApplicationController
  def index
  		@categories = Category.pluck(:category_type)
  	render 'layouts/navigation/collapsible_links_partial_path'
  end
end
