# == Schema Information
#
# Table name: instagram_accounts
#
#  id           :integer          not null, primary key
#  account_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  image        :string
#

class InstagramAccount < ApplicationRecord
  belongs_to :user
  has_many :instagram_contents, inverse_of: :instagram_account, dependent: :destroy
end
