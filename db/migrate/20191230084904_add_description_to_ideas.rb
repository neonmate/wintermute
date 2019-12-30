class AddDescriptionToIdeas < ActiveRecord::Migration[6.0]
  def change
    add_column :ideas, :description, :string

    update('UPDATE ideas SET description = title')
  end
end
