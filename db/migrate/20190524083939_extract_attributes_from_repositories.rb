class ExtractAttributesFromRepositories < ActiveRecord::Migration[5.2]
  REPOSITORY_URL_PATTERN = %r(https://github\.com/(?<owner>[^/]+)/(?<name>[^/]+)).freeze

  class Repository < ActiveRecord::Base
  end

  def up
    add_column(:repositories, :owner, :string)
    add_column(:repositories, :name, :string)
    add_column(:repositories, :description, :text)
    add_column(:repositories, :homepage_url, :string)
    add_column(:repositories, :total_stars, :integer)
    add_column(:repositories, :total_watchers, :integer)
    add_column(:repositories, :total_issues, :integer)
    add_column(:repositories, :first_commit_at, :datetime)
    add_column(:repositories, :last_commit_at, :datetime)
    add_column(:repositories, :languages, :string, array: true)
    add_column(:repositories, :last_commits_at, :datetime, array: true)
    add_column(:repositories, :licence, :string)
    add_column(:repositories, :last_synchronized_at, :datetime)

    Repository.reset_column_information
    Repository.find_each do |repository|
      owner = repository.repository_url[REPOSITORY_URL_PATTERN, :owner]
      name = repository.repository_url[REPOSITORY_URL_PATTERN, :name]

      raise ArgumentError, "Missing owner for #{repository.inspect}" if owner.blank?
      raise ArgumentError, "Missing user for #{repository.inspect}" if name.blank?

      duplicate_repository = Repository.find_by(owner: owner, name: name)

      if duplicate_repository.present?
        puts(<<~TEXT)
          Unique index violation for owner #{owner} and name #{name}

          Kept: Repository with ID #{duplicate_repository.id}
          Deleted: Repository with ID #{repository.id}
        TEXT

        repository.delete!
      else
        repository_stats = repository.repository_stats

        repository.attributes = {
          owner: owner,
          name: name,
          description: repository_stats['description'],
          homepage_url: repository_stats['homepage_url'],
          total_stars: repository_stats['total_stars']&.to_i,
          total_watchers: repository_stats['total_watchers']&.to_i,
          total_issues: repository_stats['total_issues']&.to_i,
          first_commit_at: repository_stats['created_at'],
          last_commit_at: repository_stats['last_commits']&.first,
          last_commits_at: Array(repository_stats['last_commits']),
          languages: Array(repository_stats['languages']),
          licence: repository_stats['licence'],
          last_synchronized_at: repository_stats['last_synchronized_at']
        }

        repository.save!
      end
    end

    add_index(:repositories, [:name, :owner])
    remove_column(:repositories, :repository_stats, :jsonb)
    remove_column(:repositories, :repository_url, :string)
  end

  def down
    add_column(:repositories, :repository_stats, :jsonb)
    add_column(:repositories, :repository_url, :string)
    add_index(:repositories, :repository_url, unique: true)

    Repository.reset_column_information
    Repository.find_each do |repository|
      repository.repository_url = "https://github.com/#{repository.owner}/#{repository.name}"
      repository.repository_stats = {
        description: nil,
        created_at: nil,
        homepage_url: nil,
        total_stars: nil,
        total_watchers: nil,
        total_issues: nil,
        languages: [],
        last_commits: [],
        licence: nil,
        last_synchronized_at: nil,
      }

      repository.save!
    end

    remove_index(:repositories, [:name, :owner])

    remove_column(:repositories, :owner, :string)
    remove_column(:repositories, :name, :string)
    remove_column(:repositories, :description, :text)
    remove_column(:repositories, :homepage_url, :string)
    remove_column(:repositories, :total_stars, :integer)
    remove_column(:repositories, :total_watchers, :integer)
    remove_column(:repositories, :total_issues, :integer)
    remove_column(:repositories, :first_commit_at, :datetime)
    remove_column(:repositories, :last_commit_at, :datetime)
    remove_column(:repositories, :last_commits_at, :datetime, array: true)
    remove_column(:repositories, :languages, :string, array: true)
    remove_column(:repositories, :licence, :string)
    remove_column(:repositories, :last_synchronized_at, :datetime)
  end
end
