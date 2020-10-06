require 'rails_helper'

RSpec.describe "jobs/show", type: :view do
  before(:each) do
    @job = assign(:job, Job.create!(
      title: "Title",
      description: "MyText",
      url: "Url",
      job_type: "Job Type",
      location: "Location",
      remote_ok: false,
      link_to_apply: "Link To Apply",
      status: "Status",
      price: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Job Type/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Link To Apply/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/2/)
  end
end
