class User < ApplicationRecord

  has_many :repositories
  has_many :ideas
  has_many :messages

  validates :uid, :email, :nickname, presence: true
  validates :uid, uniqueness: true

  def to_s
    nickname
  end

end
