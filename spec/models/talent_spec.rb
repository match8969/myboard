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

require 'rails_helper'

RSpec.describe Talent, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
