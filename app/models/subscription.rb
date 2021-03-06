class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless: -> { user.present? }

  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }
  validate :subscription_is_not_created_by_user, if: -> { user.present? }
  validate :email_already_taken, unless: -> { user.present? }

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  private

  def email_already_taken
    errors.add(:user_email, :email_exists) if User.exists?(email: user_email)
  end

  def subscription_is_not_created_by_user
    errors.add(:user_name, :cant_subscribe_event_owner) if event.user == user
  end
end
