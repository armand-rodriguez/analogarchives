class HomeController < ApplicationController
  def index
  end
  def contact
  end
  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(from: @email,
                            to: 'myemail@domain.com',
                            subject: 'A new contact message from #{@name}',
                            body: @message).deliver_now
  end
end
