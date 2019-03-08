class Power

  include Consul::Power
  include DoesProjects

  attr_reader :user

  def initialize(user)
    @user = user
  end

end
