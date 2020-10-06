class DashboardController < ApplicationController
  before_action :authenticate_user!
    layout "dashlayout"

  # load_and_authorize_resource
  respond_to :html

  def index
    @my_companies  = current_user.companies
    @my_jobs       = current_user.jobs
    respond_with(@companies, @jobs)
  end

  def my_companies
    @companies  = current_user.companies 
  end
end
