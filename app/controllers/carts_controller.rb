# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :show, only: %i[address_show_add payment_success payment_option]

  def show
    @order = Order.new
  
    cart_ids = $redis.smembers current_user_cart
    @cart_products = Product.find(cart_ids)
    @cart_total_price = 0
    @cart_discount = 0
    @cart_products.each do |product|
      @cart_total_price += product.price
      @cart_discount += product.discount
    end
  end

  def add
    $redis.sadd current_user_cart, params[:product_id]
    redirect_to action: 'show'
    # render json: current_user.cart_count, status: 200
  end

  def remove
    $redis.srem current_user_cart, params[:product_id]
    redirect_to action: 'show'
    # render json: current_user.cart_count, status: 200
  end

  def address_show_add
    @address = Address.where(user_id: current_user.id)
    puts "hjhkhk#{params[:order][:quantity]}"
    @user = User.find(current_user.id)
  end

  def new_address
    @user = User.find(current_user.id)
  end

  def payment_option; end

  def payment_success
    # while(params[:id].count)
    product_ids = params[:id].split('/')
    @user = User.find(current_user.id)
    product_ids.each do |id|
      puts "ppppppp#{params[:quantity]}"
      @order = Order.new(user_id: current_user.id, product_id: id, quantity: params[:quantity])

      next unless @order.save

      OrderMailer.with(user: @user).order_email.deliver_now
      @products = Product.find(id)
      $redis.srem current_user_cart, id
      @products.decrement!(:stock, by= params[:quantity].to_i)
      # 	render "payment_success"
      # else
      # 	render plain: @order.product_id
      # end
    end
  end

  private

  def current_user_cart
    "cart#{current_user.id}"
  end

  def order_params
    params.require(:order).permit.merge(user_id: current_user.id, product_id: params[:id])
  end
end
