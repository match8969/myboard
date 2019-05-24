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

class InstagramContent < ApplicationRecord
  mount_uploaders :images, ImageUploader
  serialize :avatars, JSON # If you use SQLite, add this line.
  belongs_to :instagram_account
end
