class UserMailer < ApplicationMailer
  default from: "armand.j.rodriguez@gmail.com"
  def contact_form(email, name, message)
    @message = message
    mail(from: email,
        to: 'armand.j.rodriguez@gmail.com',
        subject: 'A new contact form message from #{name}')
  end
  def order_form(user, cart)
    @user_first_name = user.first_name
    @total_price = cart.total_price
    @products = cart.line_items
    mail(
      to: user.email,
      subject: "Thank you for submitting your order to Analog Archives!"
    )

  end
  def shipping_confirmation(user, order, cart)
    @order_number = order.id
    @user_first_name = user.first_name
    @products = cart.line_items
    @total_price = cart.total_price
    mail(
      to: user.email,
      subject: "Your order has been shipped! Thank you for your purchase!"
    )
  end
end
