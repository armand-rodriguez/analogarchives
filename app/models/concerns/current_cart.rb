module CurrentCart

private
#
# def set_cart
#   @cart = Cart.find(session[:cart_id])
# rescue ActiveRecord::RecordNotFound
#   @cart = Cart.create
#   session[:cart_id] = @cart.id
# end

def set_cart
  @cart = Cart.find(session[:cart_id])
  if @cart.status == 2
    @cart = Cart.create
    session[:cart_id] = @cart.id
    @cart.update_attributes(user_id: current_user.id)
  end
rescue ActiveRecord::RecordNotFound
  @cart = Cart.create
  session[:cart_id] = @cart.id
  @cart.update_attributes(user_id: current_or_guest_user.id)

end


end
