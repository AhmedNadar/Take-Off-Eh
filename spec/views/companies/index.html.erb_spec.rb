require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        name: "Name",
        details: nil,
        email: "Email",
        website: "Website",
        user: nil
      ),
      Company.create!(
        name: "Name",
        details: nil,
        email: "Email",
        website: "Website",
        user: nil
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Website".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
