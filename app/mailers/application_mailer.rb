class ApplicationMailer < ActionMailer::Base
  if Rails.env.production?
    default from: ENV['MAILJET_SENDER']
  end
    default from: 'test@test.net'
  layout 'mailer'
end
