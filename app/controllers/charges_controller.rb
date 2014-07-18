class ChargesController < ApplicationController

	def new
		@post = Post.find params[:post_id]
	end

	def create
		@post = Post.find params[:post_id]
		@amount = 100 * @post.amount

		customer = Stripe::Customer.create(
		:email => 'example@stripe.com',
		:card  => params[:stripeToken]
		)

		charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount.to_i,
	    :description => "Print of #{@post.title}",
	    :currency    => 'usd'
	  	)

	  	Order.create(user: current_user, post: @post)
	  	flash[:notice] = 'Thanks for your order'
	  	redirect_to '/posts'

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to post_charges_path(@post)
	end
end
