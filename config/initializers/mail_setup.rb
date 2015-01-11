ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "onlineduna.com",
    :user_name            => MAIL_CONFIG['user_name'],
    :password             => MAIL_CONFIG['password'],
    :authentication       => "plain",
    :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"