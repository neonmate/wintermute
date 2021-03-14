class AddStateAttributeToRepositories < ActiveRecord::Migration[6.1]
  def up
    add_column :repositories, :state, :string
    update("UPDATE repositories SET state = 'draft'")
  end

  def down
    remove_column :repositories, :state
  end
end
