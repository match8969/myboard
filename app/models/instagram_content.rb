# == Schema Information
#
# Table name: instagram_contents
#
#  id                   :integer          not null, primary key
#  instagram_account_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  image                :string
#

class InstagramContent < ApplicationRecord
  belongs_to :instagram_account
end
