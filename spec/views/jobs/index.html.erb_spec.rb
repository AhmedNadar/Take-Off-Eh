require 'rails_helper'

RSpec.describe "jobs/index", type: :view do
  before(:each) do
    assign(:jobs, [
      Job.create!(
        title: "Title",
        description: "MyText",
        url: "Url",
        job_type: "Job Type",
        location: "Location",
        remote_ok: false,
        link_to_apply: "Link To Apply",
        status: "Status",
        price: 2
      ),
      Job.create!(
        title: "Title",
        description: "MyText",
        url: "Url",
        job_type: "Job Type",
        location: "Location",
        remote_ok: false,
        link_to_apply: "Link To Apply",
        status: "Status",
        price: 2
      )
    ])
  end

  it "renders a list of jobs" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Url".to_s, count: 2
    assert_select "tr>td", text: "Job Type".to_s, count: 2
    assert_select "tr>td", text: "Location".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: "Link To Apply".to_s, count: 2
    assert_select "tr>td", text: "Status".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
