class DropExternalRepositoryReviews < ActiveRecord::Migration[6.1]
  def up
    drop_table :external_repository_reviews
  end

  def down
    create_table :external_repository_reviews do |t|
      t.string :identifier
      t.string :homepage_url
      t.string :state

      t.timestamps
    end

    add_index :external_repository_reviews, :identifier, unique: true
  end
end
