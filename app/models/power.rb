class Power

  include Consul::Power
  include DoesIdeas
  include DoesMessages
  include DoesRepositories
  include DoesUserSubscriptions

  attr_reader :user

  def initialize(user)
    @user = user
  end

end
