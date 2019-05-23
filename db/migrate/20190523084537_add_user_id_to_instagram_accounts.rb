class AddUserIdToInstagramAccounts < ActiveRecord::Migration[5.2]
  def change
    add_reference :instagram_accounts, :user, index: true
  end
end
