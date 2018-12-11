class UserMailer < ApplicationMailer
  default from: "analog.arkives@gmail.com"
  def contact_form(email, name, message)
    @message = message
    mail(from: email,
        to: 'analog.arkives@gmail.com',
        subject: 'A new contact form message from #{name}')
  end
end
