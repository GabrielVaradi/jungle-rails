
class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email(user, order)
    @order = order
    @user = user
    @url  = 'http://localhost:3000/'
    mail(to: @user.email, subject: "Thanks you! Your order number is #{@order.id}")
  end
end