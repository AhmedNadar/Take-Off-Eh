class DashboardController < ApplicationController
  before_action :authenticate_user!
    layout "dashlayout"

  # load_and_authorize_resource
  respond_to :html

  def index
    @my_companies  = current_user.companies
    @my_jobs       = current_user.jobs
    @my_events       = current_user.events
    respond_with(@companies, @jobs)
  end

  def my_companies
    @companies  = current_user.companies 
  end
  def my_jobs
    @jobs  = current_user.jobs 
  end
  def my_events
    @events  = current_user.events 
  end
end
