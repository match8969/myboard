class RemoveUserFromInstagramAccounts < ActiveRecord::Migration[5.2]
  def change
    remove_column :instagram_accounts, :user_id, :integer
  end
end
