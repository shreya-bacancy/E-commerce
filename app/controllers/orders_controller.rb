class OrdersController < ApplicationController
	def destroy
		if user_signed_in?
			@order = Order.where(product_id:params[:id], user_id: current_user.id)
			@order.destroy_all
			render "order_show"
		else
			@order = Order.where(product_id:params[:id])
			@order.destroy_all
		end
	end
end
