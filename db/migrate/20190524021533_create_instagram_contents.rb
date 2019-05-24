class CreateInstagramContents < ActiveRecord::Migration[5.2]
  def change
    create_table :instagram_contents do |t|
      t.references :instagram_account, foreign_key: true

      t.timestamps
    end
  end
end
