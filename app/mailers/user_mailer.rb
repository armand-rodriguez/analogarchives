class UserMailer < ApplicationMailer
  default from: "armand.j.rodriguez@gmail.com"
  def contact_form(email, name, message)
    @message = message
    mail(from: email,
        to: 'analog.arkives@gmail.com',
        subject: 'A new contact form message from #{name}')
  end
  def order_form(user)
    mail(
      to: user.email,
      subject: "Thank you for submitting your order to Analog Archives!"
    )

  end
end
