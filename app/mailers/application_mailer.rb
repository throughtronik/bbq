class ApplicationMailer < ActionMailer::Base
  if Rails.env.development?
    default from: 'test@mail.net'
  else
    default from: ENV['MAILJET_SENDER']
  end

  layout 'mailer'
end
