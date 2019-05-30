class RenameProjectsToRepositories < ActiveRecord::Migration[5.2]
  def change
    rename_table('projects', 'repositories')
  end
end
