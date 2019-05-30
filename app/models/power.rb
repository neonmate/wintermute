class Power

  include Consul::Power
  include DoesRepositories

  attr_reader :user

  def initialize(user)
    @user = user
  end

end
