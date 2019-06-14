require 'rails_helper'

RSpec.describe "Admin::Talents", type: :request do
  describe "GET /admin/talents" do
    it "works! (now write some real specs)" do
      get admin_talents_index_path
      expect(response).to have_http_status(200)
    end
  end
end
