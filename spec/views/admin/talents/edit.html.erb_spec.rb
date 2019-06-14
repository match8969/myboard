require 'rails_helper'

RSpec.describe "admin/talents/edit", type: :view do
  before(:each) do
    @admin_talent = assign(:admin_talent, Talent.create!())
  end

  it "renders the edit admin_talent form" do
    render

    assert_select "form[action=?][method=?]", admin_talent_path(@admin_talent), "post" do
    end
  end
end
