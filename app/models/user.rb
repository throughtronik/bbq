class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 35 }

  has_many :events
  has_many :comments, dependent: :destroy
  has_many :subscriptions

  after_commit :link_subscriptions, on: :create

  private

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: user.email).update_all(user_id: self.id)
  end
end
