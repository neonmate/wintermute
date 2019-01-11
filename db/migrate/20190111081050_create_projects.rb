class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.string :repository_url
      t.string :application_url
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
