class Message < ApplicationRecord

  include DoesTextFilter[TextFilter]

  belongs_to :conversation
  belongs_to :user

  validates :body, presence: true
end
