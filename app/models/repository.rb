class Repository < ApplicationRecord

  include RailsStateMachine::Model
  include DoesTextFilter[TextFilter]
  include DoesArchive

  mount_uploader :preview_image, ImageUploader

  belongs_to :user

  scope :default_order, -> { order('last_commit_at DESC NULLS LAST', :id) }
  scope :published, -> { where(state: 'published') }

  has_defaults(languages: [], last_commits_at: [])

  validates :owner, presence: true
  validates :name, presence: true, uniqueness: { scope: :owner }
  validates :preview_image, presence: true, if: :published?

  has_many :messages, as: :parent, dependent: :destroy
  has_many :user_subscriptions, class_name: 'User::Subscription', as: :subscribable

  state_machine do
    state :draft, initial: true
    state :published
    state :rejected

    event :publish do
      transitions from: [:draft, :rejected], to: :published
    end

    event :reject do
      transitions from: [:published], to: :rejected
    end
  end

  def messages_with_default_order
    messages.order([created_at: :asc], :id)
  end

  def repository_url_preview
    return if owner.blank? || name.blank?

    "https://github.com/#{owner_and_name}"
  end

  def to_s
    owner_and_name
  end

  private

  def owner_and_name
    "#{owner}/#{name}"
  end

end
