class UserMailer < ApplicationMailer
  def confirmation(user, token, path)
    @user = user
    @url = '' # site_url/path/token
    mail(to: @user.email, subject: 'Email confirmation')
  end
end
