class AddImagesToInstagramContents < ActiveRecord::Migration[5.2]
  def change
    add_column :instagram_contents, :images, :string
  end
end
