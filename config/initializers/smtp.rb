ActionMailer::Base.smtp_settings = {
  address: 'smtp.eu.mailgun.org',
  port: 587,
  domain: 'mg.jumpintram.com',
  authentication: 'plain',
  user_name: ENV['SMTP_USER_NAME'],
  password: ENV['SMTP_PASSWORD']
}

