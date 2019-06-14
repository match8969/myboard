require 'rails_helper'

RSpec.describe "admin/talents/show", type: :view do
  before(:each) do
    @admin_talent = assign(:admin_talent, Talent.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
