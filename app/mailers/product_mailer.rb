class ProductMailer < ApplicationMailer
  default from: 'master2009sales@gmail.com'

  # Sending for the all users when product created
  def sending_news_email(news, email)
    @email = email
    @news = news
    mail(to: @email, subject: 'Новости от компании мастер')
  end

  def sending_email(product, email)
    @email = email
    @product = product
    mail(to: @email, subject: 'У нас вышла новая позиция')
  end

end
