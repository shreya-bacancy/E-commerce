class OrdersController < ApplicationController
	def destroy
		@order = Order.where(product_id:params[:id], user_id: current_user.id)
		@order.destroy_all
		render "order_show"
	end
end
