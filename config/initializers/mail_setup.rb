ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "onlineduna.com",
    :user_name            => "onlineduna@gmail.com",
    :password             => "JanHus671415",
    :authentication       => "plain",
    :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"