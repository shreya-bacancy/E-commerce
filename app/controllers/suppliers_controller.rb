# frozen_string_literal: true

class SuppliersController < ApplicationController
  def order_mgmt
    @products =	current_supplier.products.joins(:order_details,[{orders: :user}]).pluck('users.name,products.name,order_details.created_at,products.id,users.id,order_details.order_status')
 		@order_detail = OrderDetail.new
    respond_to do |format|
    format.html
    format.pdf do
    render pdf: "suppliers/orders.pdf",
    template: "suppliers/order_mgmt.pdf.erb",
    layout: 'application.html'
    end
    end
  end

  def export_csv
    @products =	current_supplier.products.joins(:order_details,[{orders: :user}]).pluck('users.name,products.name,order_details.created_at,products.id,users.id,order_details.order_status')
 	  respond_to do |format|
    format.html {}
    format.csv { send_data @products.to_csv ,filename: "order_details-#{Date.today}.csv"
    }
    end  
  end

  def delivered_product
    @products =	current_supplier.products.joins(:order_details,[{orders: :user}]).pluck('users.name,products.name,order_details.created_at,products.id,users.id,order_details.order_status')
  end

  def delivered_create
  	@order = OrderDetail.find_by(product_id: params[:product_id])
  	if @order.update(order_status: true, delivery_date: Date.today)
  		redirect_to delivered_product_path
  	end
  end

  def ofs_products
  	@products = Product.where(supplier_id: current_supplier.id, stock: 0)
  	render "supplier/out_of_stock_products"
  end
end
