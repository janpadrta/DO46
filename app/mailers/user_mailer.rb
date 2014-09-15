class UserMailer < ActionMailer::Base
  default from: 'admin@duneonline.com'

  def activation_needed_email(user)
    @user = user
    @url  = "http://0.0.0.0:3000/users/#{user.activation_token}/activate"
    mail(:to => user.email,
         :subject => t('user_mailer.activation_needed_email.welcome_subject'))
  end

  def activation_success_email(user)
    @user = user
    @url  = "http://0.0.0.0:3000/login"
    mail(:to => user.email,
         :subject => t('user_mailer.activation_success_email.activation_subject'))
  end

  def reset_password_email(user)
    @user = user
    @url  = edit_password_reset_url(user.reset_password_token)
    mail(:to => user.email,
         :subject => t('user_mailer.reset_password_email.pass_reset'))
  end

end
