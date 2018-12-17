class PaymentsController < ApplicationController

  def new

  end
  
  def create
  token = params[:stripeToken]
  # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: @cart.total_price/100.to_f, # amount in cents, again
        currency: "usd",
        source: token,
        description: params[:stripeEmail]
      )
      if charge.paid
        Order.create(user_id: @user, product_id: @product, total: @product.price )
      end
    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
  redirect_to products_path
  end
end
