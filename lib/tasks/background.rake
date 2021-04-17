namespace :background do

  desc 'Synchronize repository stats of a repository'
  task synchronize_repositories: :environment do
    Repository::Synchronizer.run
  end

end
