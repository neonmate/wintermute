class AddUserToProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :user, foreign_key: false
  end
end
