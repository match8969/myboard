class ChangeDatatypeImageOfInstagramContents < ActiveRecord::Migration[5.2]
  def change
    change_column :instagram_contents, :image, :text
  end
end
