require 'rails_helper'

RSpec.describe "Admin::InstagramAccounts", type: :request do
  describe "GET /admin/instagram_accounts" do
    it "works! (now write some real specs)" do
      get admin_instagram_accounts_index_path
      expect(response).to have_http_status(200)
    end
  end
end
