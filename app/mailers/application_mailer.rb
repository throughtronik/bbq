class ApplicationMailer < ActionMailer::Base
  if Rails.env.production?
    default from: ENV['MAILJET_SENDER']
  else
    default from: 'test@test.net'
  end
  layout 'mailer'
end
