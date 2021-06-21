module UserHelper

  def mailing_status_checked(user)
    user.mailing_status.present? ? 'checked' : ''
  end

end