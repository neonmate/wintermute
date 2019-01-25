class User < ApplicationRecord

  validates :uid, :email, :nickname, presence: true
  validates :uid, uniqueness: true

end
