class UserMailer < ApplicationMailer
  def confirmation(user, token, path)
    @user = user
    @confirmation_url = URI.parse("#{path}?email_token=#{token}").to_s
    mail(to: @user.email, subject: 'Email confirmation')
  end
end
