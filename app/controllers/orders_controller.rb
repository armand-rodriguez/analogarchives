class OrdersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  # skip_authorize_resource only: [:show, :new, :create]

  def index
    @orders = Order.all
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
    # @cart = Cart.find(session[:cart_id])
    # if Order.exists? user_id: current_user.id
    #   @order = Order.find_by(user_id: :user_id)
    # else
    #   @order = Order.create(user_id: current_user.id, cart_id: @cart.id)
    # end
  end

  def create
    #you need to make the cart available here so that you can add params from cart into order
    @user = current_user
    @cart = Cart.find(session[:cart_id])
    @order = @cart.orders.new(order_params)
    respond_to do |form|
      if @order.save
        form.html{ redirect_to @cart, notice: 'order was created' }
        form.json{ render 'show', status: :created, location: @order }
        @cart.increment!(:status, 1)
      else
        form.html{ render 'index', notice: 'there was a problem.' }
        form.json{ render json: @order.errors, status: unprocessable_entity }
      end
    end

  end

  def destroy

  end

  private

  def order_params
    params.require(:order).permit(:cart_id, :user_id, :total_price)
  end
end
