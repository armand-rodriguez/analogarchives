class OrdersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  # skip_authorize_resource only: [:show, :new, :create]

  def index
    if current_user.admin?
      if params[:q]
        #search based on id or some sort of order number
        search_term = params[:q]
        @orders = Order.where(id: search_term)
      else
        @orders = Order.all
      end
    else
      @orders= Order.where(user_id: current_user.id)
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    # this first line you might not need because its already called in the application controller through the current_cart concern
    @cart = Cart.find(session[:cart_id])
    # @cart.user_id = current_user.id
    if @cart.total_price == 0
      redirect_to products_path
      flash[:alert] = "Your cart is currently empty!"
    end
    @order = Order.new

  end

  def create
    #you need to make the cart available here so that you can add params from cart into order
    @user = current_user
    @cart = Cart.find(session[:cart_id])
    @order = @cart.orders.new(order_params)

    token = params[:stripeToken]

    card_brand = params[:user][:card_brand]
    card_exp_month = params[:user][:card_exp_month]
    card_exp_year = params[:user][:card_exp_year]
    card_last4 = params[:user][:card_last4]

    charge = Stripe::Charge.create(

      :amount => @cart.total_price.to_i,
      :currency => "usd",
      :description => @cart.user.first_name,
      :statement_descriptor => @cart.user.first_name,
      :source => token
    )


    current_user.stripe_id = charge.id
    current_user.card_brand = card_brand
    current_user.card_exp_month = card_exp_month
    current_user.card_exp_year = card_exp_year
    current_user.card_last4 = card_last4
    current_user.save!

    respond_to do |form|
      if @order.save
        form.html{ redirect_to @cart, notice: 'order was created' }
        form.json{ render 'show', status: :created, location: @order }
        @cart.increment!(:status, 1)
        UserMailer.order_form(current_user, @cart).deliver_now
      else
        form.html{ render 'index', notice: 'there was a problem.' }
        form.json{ render json: @order.errors, status: unprocessable_entity }
      end
    end

  rescue Stripe::CardError
    flash.alert = e.message
    render :new

  end

  def destroy

  end

  #be careful about routing this action

  def update

  end

  def edit
    @order = Order.find(params[:id])
    @cart = @order.cart
    if @cart.status == 2
      if @cart.update_attributes(status: 3)
        UserMailer.shipping_confirmation(@cart.user, @order, @cart).deliver_now
        redirect_to @order
        flash[:notice] = "Marked as shipped!"
      end
    end

  end



  private

  def order_params
    params.require(:order).permit(:cart_id, :user_id, :total_price)
  end
end
