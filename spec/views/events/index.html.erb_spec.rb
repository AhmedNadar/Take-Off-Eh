require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        name: "Name",
        date.datetime: "Date.Datetime",
        location: "Location",
        user: nil,
        category: "Category"
      ),
      Event.create!(
        name: "Name",
        date.datetime: "Date.Datetime",
        location: "Location",
        user: nil,
        category: "Category"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Date.Datetime".to_s, count: 2
    assert_select "tr>td", text: "Location".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Category".to_s, count: 2
  end
end
