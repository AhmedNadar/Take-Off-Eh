class HomeController < ApplicationController
  # skip_before_action :authenticate_user!

  def index
    @companies = Company.order('created_at DESC').limit(8)
    @blogs = Blog.order('created_at DESC').limit(8)
    @jobs = Job.order('created_at DESC').limit(10)
    @events = Event.order('created_at DESC').limit(10)
  end
end
