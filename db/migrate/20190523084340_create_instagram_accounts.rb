class CreateInstagramAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :instagram_accounts do |t|
      t.string :account_name

      t.timestamps
    end
  end
end
