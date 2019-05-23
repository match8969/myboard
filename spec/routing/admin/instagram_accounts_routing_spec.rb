require "rails_helper"

RSpec.describe Admin::InstagramAccountsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/admin/instagram_accounts").to route_to("admin/instagram_accounts#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/instagram_accounts/new").to route_to("admin/instagram_accounts#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/instagram_accounts/1").to route_to("admin/instagram_accounts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/instagram_accounts/1/edit").to route_to("admin/instagram_accounts#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/admin/instagram_accounts").to route_to("admin/instagram_accounts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/instagram_accounts/1").to route_to("admin/instagram_accounts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/instagram_accounts/1").to route_to("admin/instagram_accounts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/instagram_accounts/1").to route_to("admin/instagram_accounts#destroy", :id => "1")
    end
  end
end
