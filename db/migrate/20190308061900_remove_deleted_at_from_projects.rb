class RemoveDeletedAtFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :deleted_at, :datetime
  end
end
