class AddRepositoryStatsToProjects < ActiveRecord::Migration[5.2]
  class Project < ActiveRecord::Base
  end

  def up
    add_column(:projects, :repository_stats, :jsonb)

    Project.reset_column_information
    Project.find_each do |project|
      project.repository_stats = {
        description: nil,
        created_at: nil,
        homepage_url: project.application_url,
        total_stars: nil,
        total_watchers: nil,
        total_issues: nil,
        languages: [],
        last_commits: [],
        licence: nil,
        last_synchronized_at: nil,
      }

      project.save!
    end

    remove_column(:projects, :application_url, :string)
  end

  def down
    add_column(:projects, :application_url, :string)

    Project.reset_column_information
    Project.find_each do |project|
      project.update!(application_url: project.repository_stats['homepage_url'])
    end

    remove_column(:projects, :repository_stats, :jsonb)
  end
end
