class Project < ApplicationRecord

  acts_as_paranoid

  REPOSITORY_URL_PATTERN = %r(https://github.com/\S+)
  APPLICATION_URL_PATTERN = %r(https?:\/\/\S+)

  validates :title, :subtitle, :description, :repository_url, presence: true
  validates :repository_url, format: {with: REPOSITORY_URL_PATTERN}
  validates :application_url, format: {with: APPLICATION_URL_PATTERN, allow_blank: true}

end
