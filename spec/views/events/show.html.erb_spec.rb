require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      name: "Name",
      date.datetime: "Date.Datetime",
      location: "Location",
      user: nil,
      category: "Category"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Date.Datetime/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Category/)
  end
end
