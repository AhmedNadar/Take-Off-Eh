class DashboardController < ApplicationController
  before_action :authenticate_user!
    # layout "dashlayout"

  load_and_authorize_resource
  respond_to :html

  def index
    @companies  = current_user.companies
    respond_with(@companies)
  end
end
