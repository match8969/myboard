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

FactoryBot.define do
  factory :talent do
    name { "MyString" }
  end
end
