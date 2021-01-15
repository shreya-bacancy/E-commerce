# frozen_string_literal: true

class SuppliersController < ApplicationController
  def order_mgmt
    @products =	Product.where(supplier_id: current_supplier.id).joins(orders: :user).pluck('users.name,products.name,orders.created_at,products.id,users.id,orders.order_status')
 		@order = Order.new
   
  end

  def export_csv
    @products = Product.where(supplier_id: current_supplier.id).joins(orders: :user).pluck('users.name,products.name,orders.created_at,products.id,users.id,orders.order_status')
    respond_to do |format|
    format.html {}
    format.csv { send_data @products.to_csv ,filename: "orders-#{Date.today}.csv"
    }
    end  
  end

  def delivered_product

  	@products =	Product.where(supplier_id: current_supplier.id).joins(orders: :user).where(orders:{order_status:1}).pluck('users.name,products.name,orders.delivery_date,products.id,users.id')	
  end

  def delivered_create
  	@order = Order.find_by(product_id: params[:product_id])
  	if @order.update(order_status: true, delivery_date: Date.today)
  		redirect_to delivered_product_path
  	end
  end

  def ofs_products
  	@products = Product.where(supplier_id: current_supplier.id, stock: 0)
  	render "supplier/out_of_stock_products"
  end
end
