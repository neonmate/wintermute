class Power

  include Consul::Power
  include DoesConversations
  include DoesMessages
  include DoesRepositories

  attr_reader :user

  def initialize(user)
    @user = user
  end

end
