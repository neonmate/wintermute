class AddPreviewImageToRepositories < ActiveRecord::Migration[6.1]
  def change
    add_column :repositories, :preview_image, :string
  end
end
