# == Schema Information
#
# Table name: instagram_contents
#
#  id                   :integer          not null, primary key
#  instagram_account_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  images               :string
#

FactoryBot.define do
  factory :instagram_content do
    instagram_account { nil }
  end
end
