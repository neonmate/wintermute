class ChangeMessagesToPolymorphicRecords < ActiveRecord::Migration[6.0]
  def up
    remove_foreign_key(:messages, :conversations)
    rename_table(:conversations, :ideas)

    remove_index(:messages, :conversation_id)
    rename_column(:messages, :conversation_id, :parent_id)
    add_column(:messages, :parent_type, :string)
    add_index(:messages, [:parent_id, :parent_type])

    update("UPDATE messages SET parent_type = 'Idea'")
  end

  def down
    rename_table(:ideas, :conversations)

    update("DELETE FROM messages WHERE parent_type != 'Idea'")

    remove_index(:messages, [:parent_id, :parent_type])
    remove_column(:messages, :parent_type)
    rename_column(:messages, :parent_id, :conversation_id)
    add_index(:messages, :conversation_id)
    add_foreign_key(:messages, :conversations)
  end
end
