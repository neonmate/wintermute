class AddDeliveryModelToRepositories < ActiveRecord::Migration[6.1]
  def change
    add_column :repositories, :delivery_model, :string

    update("UPDATE repositories SET delivery_model = 'self_hosted' WHERE state = 'published'")
  end
end
