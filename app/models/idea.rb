class Idea < ApplicationRecord

  include DoesTextFilter[TextFilter]

  belongs_to :user
  has_many :messages, as: :parent, dependent: :destroy
  has_many :user_subscriptions, as: :subscribable

  scope :default_order, -> { order(created_at: :desc) }

  validates :title, :description, :body, presence: true

  def messages_with_default_order
    messages.order([created_at: :asc], :id)
  end
end
