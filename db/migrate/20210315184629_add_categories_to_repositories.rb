class AddCategoriesToRepositories < ActiveRecord::Migration[6.1]
  def change
    add_column :repositories, :categories, :string

    update("UPDATE repositories SET categories = 'unknown' WHERE state = 'published'")
  end
end
