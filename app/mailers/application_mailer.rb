class ApplicationMailer < ActionMailer::Base
  default from: "#{ENV['MAILJET_SENDER_NAME']} <#{ENV['MAILJET_SENDER']}>" || ENV['DEV_MAIL_SENDER']
  layout 'mailer'
end
