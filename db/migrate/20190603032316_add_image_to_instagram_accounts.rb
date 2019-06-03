class AddImageToInstagramAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :instagram_accounts, :image, :string
  end
end
