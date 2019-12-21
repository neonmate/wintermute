class Repository < ApplicationRecord

  include DoesTextFilter[TextFilter]

  belongs_to :user

  scope :default_order, -> { order('last_commit_at DESC NULLS LAST', :id) }

  has_defaults(languages: [], last_commits_at: [])

  validates :owner, :name, presence: true
  validates :name, uniqueness: { scope: :owner }
  has_many :messages, as: :parent, dependent: :destroy

  def repository_url_preview
    return if owner.blank? || name.blank?

    "https://github.com/#{owner}/#{name}"
  end

end
