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

require 'rails_helper'

RSpec.describe InstagramAccount, type: :model do
  let!(:instagram_account) { FactoryBot.create(:instagram_account) }
  let!(:user) { FactoryBot.create(:user) }

  describe '#is_updated_within?' do

    let!(:create_instagram_account) {
      Timecop.freeze(Time.zone.local(2019, 1, 1)) {
        InstagramAccount.create(
            account_name: 1,
            user_id: user.id
        )
      }
    }

    context '時間内に更新されていない場合' do

      before do
        Timecop.freeze(Time.zone.local(2019, 1, 1, 0, 0, 11))
        create_instagram_account
      end

      it '結果が期待通りであること' do
        expect(create_instagram_account.is_updated_within?(10)).to be false
      end
    end

    context '時間内に更新されていた場合' do

      before do
        Timecop.freeze(Time.local(2019, 1, 1, 0, 0, 1))
        create_instagram_account
      end

      it '結果が期待通りであること' do
        expect(create_instagram_account.is_updated_within?(10)).to be true
      end
    end

  end

  describe '#has_same_image_path?' do
    context '一致しない場合' do
      it '結果が期待通りであること' do
        expect(instagram_account.has_same_image_path?("image/different_path")).to be false
      end
    end

    context '一致する場合' do
      it '結果が期待通りであること' do
        expect(instagram_account.has_same_image_path?("image/account_image.jpg")).to be true
      end
    end
  end

end
