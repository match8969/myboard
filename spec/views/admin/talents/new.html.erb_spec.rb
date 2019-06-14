require 'rails_helper'

RSpec.describe "admin/talents/new", type: :view do
  before(:each) do
    assign(:admin_talent, Talent.new())
  end

  it "renders new admin_talent form" do
    render

    assert_select "form[action=?][method=?]", admin_talents_path, "post" do
    end
  end
end
