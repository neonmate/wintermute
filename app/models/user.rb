class User < ApplicationRecord

  has_many :repositories
  has_many :conversations
  has_many :messages

  validates :uid, :email, :nickname, presence: true
  validates :uid, uniqueness: true

end
