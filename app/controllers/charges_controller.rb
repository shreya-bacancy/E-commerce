class ChargesController < ApplicationController
	
	def new
	end

	def create
	  # Amount in cents
	  @amount = 500

	  customer = Stripe::Customer.create({
	    email: current_user.email,
	    name: 'Jenny Rosen',
  		address: {
    				line1: '510 Townsend St',
				    postal_code: '98140',
				    city: 'San Francisco',
				    state: 'CA',
				    country: 'US',
				  },
	    source: params[:stripeToken],
	  })

	  charge = Stripe::Charge.create({
	    customer: customer.id,
	   
	    amount: @amount,
	    description: 'Rails Stripe customer',
	    currency: 'usd',
	  })

	  # product_ids = params[:id].split('/')
   #  @user = User.find(current_user.id)
   #  product_ids.each do |id|
   #    puts "ppppppp#{params[:quantity]}"
   #    @order = Order.new(user_id: current_user.id, product_id: id, quantity: params[:quantity])

   #    next unless @order.save

   #    OrderMailer.with(user: @user).order_email.deliver_now
   #    @products = Product.find(id)
   #    $redis.srem current_user_cart, id
   #    @products.decrement!(:stock, by= params[:quantity].to_i)

   #    end
   #    redirect_to  payment_success_path(@cart_products,params[:quantity])
	
	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end

end
