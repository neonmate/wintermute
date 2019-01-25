class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :uid
      t.string :nickname

      t.timestamps
    end

    add_index :users, :uid, unique: true
  end
end
