class Message < ApplicationRecord

  include DoesTextFilter[TextFilter]

  belongs_to :parent, polymorphic: true
  belongs_to :user

  validates :body, presence: true
end
