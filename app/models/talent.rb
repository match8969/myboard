# == Schema Information
#
# Table name: talents
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Talent < ApplicationRecord
  belongs_to :user
  has_one :instagram_account, dependent: :destroy
end
