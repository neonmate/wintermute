class Project < ApplicationRecord

  REPOSITORY_URL_PATTERN = %r(https://github.com/\S+).freeze
  APPLICATION_URL_PATTERN = %r(https?:\/\/\S+).freeze

  belongs_to :user

  validates :title, :subtitle, :description, :repository_url, presence: true
  validates :repository_url, format: {with: REPOSITORY_URL_PATTERN}
  validates :application_url, format: {with: APPLICATION_URL_PATTERN, allow_blank: true}

end
