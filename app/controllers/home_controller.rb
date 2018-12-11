class HomeController < ApplicationController
  def index
  end
  def contact
  end
  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    contact_form(@email, @name, @message).deliver_now
  end
end
