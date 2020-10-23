class Power

  include Consul::Power
  include DoesIdeas
  include DoesMessages
  include DoesRepositories
  include DoesUserSubscriptions
  include DoesExternalRepositoryReviews

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def admin?
    user.admin?
  end

end
