class AddTalentToInstagramAccounts < ActiveRecord::Migration[5.2]
  def change
    add_reference :instagram_accounts, :talent, foreign_key: true
  end
end
