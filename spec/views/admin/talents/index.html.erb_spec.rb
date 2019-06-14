require 'rails_helper'

RSpec.describe "admin/talents/index", type: :view do
  before(:each) do
    assign(:talents, [
      Talent.create!(),
      Talent.create!()
    ])
  end

  it "renders a list of admin/talents" do
    render
  end
end
