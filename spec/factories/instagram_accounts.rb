# == Schema Information
#
# Table name: instagram_accounts
#
#  id           :integer          not null, primary key
#  account_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#

FactoryBot.define do
  factory :instagram_account do
    account_name { "MyString" }
  end
end
