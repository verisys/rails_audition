Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = "reply@example.com"

  config.allow_sign_up = false
  config.routes = true
  config.password_strategy = Clearance::PasswordStrategies::BCrypt
  config.redirect_url = "/"
  config.user_model = User

end
