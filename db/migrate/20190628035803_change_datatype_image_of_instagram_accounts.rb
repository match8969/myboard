class ChangeDatatypeImageOfInstagramAccounts < ActiveRecord::Migration[5.2]
  def change
    change_column :instagram_accounts, :image, :text
  end
end
