class User < ApplicationRecord

  has_many :repositories

  validates :uid, :email, :nickname, presence: true
  validates :uid, uniqueness: true

end
