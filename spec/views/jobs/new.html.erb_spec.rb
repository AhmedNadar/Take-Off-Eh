require 'rails_helper'

RSpec.describe "jobs/new", type: :view do
  before(:each) do
    assign(:job, Job.new(
      title: "MyString",
      description: "MyText",
      url: "MyString",
      job_type: "MyString",
      location: "MyString",
      remote_ok: false,
      link_to_apply: "MyString",
      status: "MyString",
      price: 1
    ))
  end

  it "renders new job form" do
    render

    assert_select "form[action=?][method=?]", jobs_path, "post" do

      assert_select "input[name=?]", "job[title]"

      assert_select "textarea[name=?]", "job[description]"

      assert_select "input[name=?]", "job[url]"

      assert_select "input[name=?]", "job[job_type]"

      assert_select "input[name=?]", "job[location]"

      assert_select "input[name=?]", "job[remote_ok]"

      assert_select "input[name=?]", "job[link_to_apply]"

      assert_select "input[name=?]", "job[status]"

      assert_select "input[name=?]", "job[price]"
    end
  end
end
