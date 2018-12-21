class OrdersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  skip_authorize_resource only: [:show, :new, :create]
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @cart = Cart.find(session[:cart_id])
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
        form.html{ redirect_to @order, notice: 'order was created' }
        form.json{ render 'show', status: :created, location: @order }
      else
        form.html{ render 'index', notice: 'there was a problem.' }
        form.json{ render json: @order.errors, status: unprocessable_entity }
      end
    end
  end

  def destroy

  end

  private

  #im not sure if this whitelist needs to be here but i'll create a spot for it for now
  def order_params
    params.require(:order).permit(:cart_id, :user_id)
  end



end
