require "rails_helper"

RSpec.describe Admin::TalentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/admin/talents").to route_to("admin/talents#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/talents/new").to route_to("admin/talents#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/talents/1").to route_to("admin/talents#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/talents/1/edit").to route_to("admin/talents#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/admin/talents").to route_to("admin/talents#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/talents/1").to route_to("admin/talents#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/talents/1").to route_to("admin/talents#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/talents/1").to route_to("admin/talents#destroy", :id => "1")
    end
  end
end
