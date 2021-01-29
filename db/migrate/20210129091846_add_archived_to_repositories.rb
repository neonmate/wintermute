class AddArchivedToRepositories < ActiveRecord::Migration[6.0]
  def change
    add_column :repositories, :archived_at, :datetime
  end
end
