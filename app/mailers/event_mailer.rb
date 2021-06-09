class EventMailer < ApplicationMailer
  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = event

    mail to: event.user.email, subject: default_i18n_subject(event_title: event.title)
  end

  def comment(event, comment, email)
    @comment = comment
    @event = event

    mail to: email, subject: default_i18n_subject(event_title: event.title)
  end

  def photo(event, new_photo, email)
    @event = event
    @new_photo = new_photo

    mail to: email, subject: default_i18n_subject(event_title: event.title)
  end
end
