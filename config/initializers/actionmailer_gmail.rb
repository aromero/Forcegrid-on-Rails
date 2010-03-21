ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address        => "smtp.gmail.com",
  :port           => 587,
  :domain         => "itparc.com",
  :authentication => :plain,
  :user_name  => "accountvalidation@itparc.com",
  :password  => "1tPa12C"
}