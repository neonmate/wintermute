class AddIndexOnRepositoriesName < ActiveRecord::Migration[6.0]
  def change
    remove_index :repositories, [:name, :owner]
    add_index :repositories, [:name, :owner], unique: true
  end
end
