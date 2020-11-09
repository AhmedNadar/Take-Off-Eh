require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      name: "MyString",
      date.datetime: "MyString",
      location: "MyString",
      user: nil,
      category: "MyString"
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input[name=?]", "event[name]"

      assert_select "input[name=?]", "event[date.datetime]"

      assert_select "input[name=?]", "event[location]"

      assert_select "input[name=?]", "event[user_id]"

      assert_select "input[name=?]", "event[category]"
    end
  end
end