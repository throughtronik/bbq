class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook vkontakte]

  validates :name, presence: true, length: { maximum: 35 }

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  after_commit :link_subscriptions, on: :create

  mount_uploader :avatar, AvatarUploader

  private

  def self.find_for_provider_oauth(access_token)

    email = access_token.info.email

    user = where(email: email).first

    if user.present?
      update(provider_avatar_url: access_token.info.image) if access_token.info.image != user.provider_avatar_url
      return user
    end

    provider = access_token.provider
    id = access_token.extra.raw_info.id
    avatar = access_token.info.image

    case provider
    when "vkontakte"
      url = "https://vk.com/#{id}"
      name = "#{access_token.extra.raw_info.first_name} #{access_token.extra.raw_info.last_name}"
    when "facebook"
      url = "https://facebook.com/#{id}"
      name = access_token.extra.raw_info.name
    end

    where(url: url, provider: provider).first_or_create! do |user|
      user.name = name
      user.email = email
      user.provider_avatar_url = avatar
      user.password = Devise.friendly_token.first(16)
    end
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
