class AddUniqueIndexToProjectsRepositoryUrl < ActiveRecord::Migration[5.2]
  class Project < ActiveRecord::Base; end

  def change
    Project.order(created_at: :desc).find_each do |project|
      project.delete if Project.where(repository_url: project.repository_url).count > 1
    end

    add_index :projects, :repository_url, unique: true
  end
end
