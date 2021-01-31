class ProductMailer < ApplicationMailer
  default from: 'master2009sales@gmail.com'

  def new_product(product)
    @product = product
    @user = User.last
    mail(to: "jekharitonov@gmail.com", subject: 'Welcome to My Awesome Site')
  end
end
