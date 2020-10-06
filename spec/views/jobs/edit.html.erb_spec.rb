require 'rails_helper'

RSpec.describe "jobs/edit", type: :view do
  before(:each) do
    @job = assign(:job, Job.create!(
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

  it "renders the edit job form" do
    render

    assert_select "form[action=?][method=?]", job_path(@job), "post" do

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
