class User < ApplicationRecord

  has_many :repositories, dependent: :restrict_with_exception
  has_many :ideas, dependent: :restrict_with_exception
  has_many :messages, dependent: :restrict_with_exception
  has_many :subscriptions, class_name: 'User::Subscription'

  validates :uid, :email, :nickname, presence: true
  validates :uid, uniqueness: true

  has_defaults admin: false

  def to_s
    nickname
  end

end
