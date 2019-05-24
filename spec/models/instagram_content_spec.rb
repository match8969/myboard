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

require 'rails_helper'

RSpec.describe InstagramContent, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
