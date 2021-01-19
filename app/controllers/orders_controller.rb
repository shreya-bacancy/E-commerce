# frozen_string_literal: true
class OrdersController < ApplicationController
  def destroy
    if user_signed_in?
      @order = current_user.order_details.where(product_id: params[:id])
      @products = current_user.order_details
    #  @products = Product.where(id: @orders.pluck(:product_id))
      @order.destroy_all
      render 'users/order_show'
    else
      @user =	User.find(params[:user_id])
      @order = OrderDetail.find_by(product_id: params[:id], user_id: params[:user_id])

      @order.delete

      OrderMailer.with(user: @user).order_cancel_email.deliver_now
      # @products =	Product.where(supplier_id:current_supplier.id).joins(orders: :user).pluck("users.name,products.name,orders.created_at,products.id,users.id")

    end
  end
end
