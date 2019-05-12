class Project < ApplicationRecord

  include DoesTextFilter[TextFilter]

  REPOSITORY_URL_PATTERN = %r(https://github\.com/\S+/\S+).freeze

  belongs_to :user

  validates :title, :subtitle, :description, :repository_url, presence: true
  validates :repository_url, format: { with: REPOSITORY_URL_PATTERN }, uniqueness: true
  validate :validate_repository_stats_against_schema

  has_defaults(
    repository_stats: {
      description: nil,
      created_at: nil,
      homepage_url: nil,
      total_stars: nil,
      total_watchers: nil,
      total_issues: nil,
      languages: [],
      last_commits: [],
      licence: nil,
      last_synchronized_at: nil,
    }
  )

  def validate_repository_stats_against_schema
    @schema ||= File.read(File.join(Rails.root, 'app', 'models', 'project', 'repository_stats_schema.json'))
    repository_stats_errors = JSON::Validator.fully_validate(@schema, repository_stats, strict: true, validate_schema: true)

    repository_stats_errors.each do |error|
      errors.add(:repository_stats, error)
    end
  end

end
