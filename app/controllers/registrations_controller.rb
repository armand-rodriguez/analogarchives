class RegistrationsController < Devise::RegistrationsController

  # POST /resource/sign_up
  def create
    super
    current_or_guest_user
    
  end

private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

end
