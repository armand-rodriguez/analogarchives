class RegistrationsController < Devise::RegistrationsController

  # POST /resource/sign_up
  def create
    super
      
      current_or_guest_user
      current_user.update_attributes(is_guest: false)
      @cart.update_attributes(user_id: current_user.id)
      # @guest.update_attributes(cart_id: nil)


  end

private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

end
