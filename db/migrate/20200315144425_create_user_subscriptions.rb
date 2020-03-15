class CreateUserSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_subscriptions do |t|
      t.references :user, foreign_key: true
      t.references :subscribable, polymorphic: true, index: { name: 'index_user_subscriptions_on_subscribable' }

      t.timestamps
    end
  end
end
