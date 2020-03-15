class Repository < ApplicationRecord

  include DoesTextFilter[TextFilter]

  belongs_to :user

  scope :default_order, -> { order('last_commit_at DESC NULLS LAST', :id) }

  has_defaults(languages: [], last_commits_at: [])

  validates :owner, :name, presence: true
  validates :name, uniqueness: { scope: :owner }
  has_many :messages, as: :parent, dependent: :destroy
  has_many :user_subscriptions, as: :subscribable

  def messages_with_default_order
    messages.order([created_at: :asc], :id)
  end

  def repository_url_preview
    return if owner.blank? || name.blank?

    "https://github.com/#{owner}/#{name}"
  end

end
