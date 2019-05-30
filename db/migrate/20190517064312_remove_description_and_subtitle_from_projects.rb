class RemoveDescriptionAndSubtitleFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :description, :string
    remove_column :projects, :subtitle, :string
    remove_column :projects, :title, :string
  end
end
