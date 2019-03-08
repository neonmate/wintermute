describe ProjectsController do

  it { is_expected.to check_power(crud: :projects, as: :project_scope) }

end
