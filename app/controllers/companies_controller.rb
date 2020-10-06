class CompaniesController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    # @companies = Company.with_attached_company_images
    @companies = Company.with_attached_company_images.all
    respond_with(@companies)
  end

  def show
    respond_with(@company)
    @team_members = @company.team_members.all
    redirect_to_slug(action: :show, object: set_company)
  end

  def new
    @company = Company.new
    # @company.team_members.new
    respond_with(@company)
  end

  def edit
  
  end

  def create
    @company = Company.new(company_params)
    @company.user = current_user
    @company.team_members.first.user_id = current_user.id
    # @company.user_id = current_user.id
    @company.save
    respond_with(@company)
  end

  def update
    @company.update(company_params)
    respond_with(@company)
  end

  def destroy
    @company.destroy
    respond_with(@company)
  end

  def my_companies
    @my_companies = current_user.companies
  end

  private
    def set_company
      @company = Company.friendly.find(params[:id])
    end

    def company_params
      params.require(:company).permit(
        :name, :details, :email, :website, :found_date, :slug, :business_model,
        :headquarter, :company_size, :company_logo, :phone_number, :stage, :industry,
        company_images:[],
        team_members_attributes: [:_destroy, :id, :title, :first_name, :last_name, :email, :profile_link, :member_photo])
    end
end