class EventMailer < ApplicationMailer

  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = event

    mail to: event.user.email, subject: I18n.t('event_mailer.subscription.email_subject', event_title: event.title)
  end

  def comment(event, comment, email)
    @comment = comment
    @event = event

    mail to: email, subject: I18n.t('event_mailer.comment.email_subject', event_title: event.title)
  end

  def photo(event, new_photo, email)
    @event = event
    @new_photo = new_photo

    mail to: email, subject: I18n.t('event_mailer.photo.email_subject', event_title: event.title)
  end
end
