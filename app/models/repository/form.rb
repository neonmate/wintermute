class Repository::Form < ActiveType::Record[Repository]
  REPOSITORY_URL_PATTERN = %r(\Ahttps://github\.com/(?<owner>[^/]+)/(?<name>[^/]+)).freeze

  attribute :repository_url, :string

  after_initialize :set_repository_url
  before_validation :split_repository_url
  before_validation :set_current_user

  validate :validate_repository_url

  private

  def set_repository_url
    self.repository_url = repository_url_preview
  end

  def split_repository_url
    return if repository_url.blank?
    self.owner = repository_url[REPOSITORY_URL_PATTERN, :owner]
    self.name = repository_url[REPOSITORY_URL_PATTERN, :name]
  end

  def set_current_user
    self.user = Power.current.user
  end

  def validate_repository_url
    return if owner.present? && name.present?

    errors.add(:repository_url, :invalid)
  end

end
