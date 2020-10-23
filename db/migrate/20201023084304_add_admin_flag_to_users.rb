class AddAdminFlagToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean

    update("UPDATE users SET admin = #{quoted_false}")
  end
end
