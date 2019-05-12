namespace :background do

  desc 'Synchronize repository stats of a project'
  task synchronize_projects: :environment do
    Project::Synchronizer.run
  end

end
