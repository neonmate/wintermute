class Idea < ApplicationRecord

  include DoesTextFilter[TextFilter]

  belongs_to :user
  has_many :messages, as: :parent, dependent: :destroy

  scope :default_order, -> { order(created_at: :desc) }

  validates :title, :body, presence: true
end
