class SendmailNotifyJob < ApplicationJob
  queue_as :default

  def perform(entity)
    event = entity.event

    all_emails = (event.subscriptions.map(&:user_email) + [event.user.email] - [entity.user&.email]).uniq

    case entity
    when Comment
      all_emails.each do |mail|
        EventMailer.comment(event, entity, mail).deliver_later
      end
    when Photo
      all_emails.each do |mail|
        EventMailer.photo(event, entity, mail).deliver_later
      end
    when Subscription
      EventMailer.subscription(event, entity).deliver_later
    end
  end
end
