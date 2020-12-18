namespace :background do

  desc 'Synchronize repository stats of a repository'
  task synchronize_repositories: :environment do
    Repository::Synchronizer.run
  end

  desc 'Import all HN items'
  task import_hn_items: :environment do
    HackerNewsItem::Importer.new.import(limit: 50_000)
  end

end
