class DropHackerNewsItems < ActiveRecord::Migration[6.1]
  def up
    drop_table :hacker_news_items
  end

  def down
    create_table :hacker_news_items do |t|
      t.bigint :identifier
      t.boolean :deleted
      t.string :type
      t.string :by
      t.datetime :time
      t.text :text
      t.boolean :dead
      t.references :parent
      t.references :poll
      t.string :kids, array: true, default: []
      t.string :url
      t.bigint :score
      t.string :title
      t.string :parts, array: true, default: []
      t.bigint :descendants

      t.timestamps
    end

    add_index(:hacker_news_items, :identifier, unique: true)
  end
end
