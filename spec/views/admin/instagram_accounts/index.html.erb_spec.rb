require 'rails_helper'

RSpec.describe "admin/instagram_accounts/index", type: :view do
  before(:each) do
    assign(:instagram_accounts, [
      InstagramAccount.create!(),
      InstagramAccount.create!()
    ])
  end

  it "renders a list of admin/instagram_accounts" do
    render
  end
end
