class ApplicationMailer < ActionMailer::Base
  default from: Settings.mail.smtp.user_name
  layout 'mailer'
end
