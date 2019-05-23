require 'rails_helper'

RSpec.describe "admin/instagram_accounts/new", type: :view do
  before(:each) do
    assign(:admin_instagram_account, InstagramAccount.new())
  end

  it "renders new admin_instagram_account form" do
    render

    assert_select "form[action=?][method=?]", admin_instagram_accounts_path, "post" do
    end
  end
end
