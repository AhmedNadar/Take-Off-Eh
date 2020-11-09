require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      name: "MyString",
      date.datetime: "MyString",
      location: "MyString",
      user: nil,
      category: "MyString"
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input[name=?]", "event[name]"

      assert_select "input[name=?]", "event[date.datetime]"

      assert_select "input[name=?]", "event[location]"

      assert_select "input[name=?]", "event[user_id]"

      assert_select "input[name=?]", "event[category]"
    end
  end
end
