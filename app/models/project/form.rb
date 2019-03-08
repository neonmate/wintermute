class Project::Form < ActiveType::Record[Project]

  before_validation :set_current_user

  private

  def set_current_user
    self.user = Power.current.user
  end

end
