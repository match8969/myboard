require 'rails_helper'

RSpec.describe "admin/instagram_accounts/edit", type: :view do
  before(:each) do
    @admin_instagram_account = assign(:admin_instagram_account, InstagramAccount.create!())
  end

  it "renders the edit admin_instagram_account form" do
    render

    assert_select "form[action=?][method=?]", admin_instagram_account_path(@admin_instagram_account), "post" do
    end
  end
end
