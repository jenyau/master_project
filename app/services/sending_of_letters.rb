class SendingOfLetters

  def initialize(target)
    @emails = get_emails
    @target = target
  end

  def call
    return false if @emails.empty? || @target.blank?

    product_or_news_send_email
  end

  private

  def get_emails
    User.where(mailing_status: true).pluck(:email)
  end

  def product_or_news_send_email
    @target.is_a?(Product) ? product_send_email : news_send_email
  end

  def product_send_email
    @emails.each do |email|
      ProductMailer.sending_email(@target, email).deliver_now
    end
  end

  def news_send_email
    @emails.each do |email|
      ProductMailer.sending_news_email(@target, email).deliver_now
    end
  end

end
