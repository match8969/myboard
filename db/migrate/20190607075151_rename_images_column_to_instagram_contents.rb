class RenameImagesColumnToInstagramContents < ActiveRecord::Migration[5.2]
  def change
    rename_column :instagram_contents, :images, :image
  end
end
