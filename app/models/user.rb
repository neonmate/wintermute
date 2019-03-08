class User < ApplicationRecord

  has_many :projects

  validates :uid, :email, :nickname, presence: true
  validates :uid, uniqueness: true

end
