require 'rails_helper'

RSpec.describe "admin/instagram_accounts/show", type: :view do
  before(:each) do
    @admin_instagram_account = assign(:admin_instagram_account, InstagramAccount.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
