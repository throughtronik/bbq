class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 35 }

  has_many :events

  before_validation :set_name, on: :create

  private

  def set_name
    self.name = "Пользователь #{rand(777)}" if self.name.blank?
  end
end
