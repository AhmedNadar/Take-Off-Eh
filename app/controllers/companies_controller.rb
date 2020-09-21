class CompaniesController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @companies = Company.all
    respond_with(@companies)
  end

  def show
    respond_with(@company)
  end

  def new
    @company = Company.new
    respond_with(@company)
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    # @company.user = current_user
    @company.user_id = current_user.id
    @company.save
    respond_with(@company)
  end

  def update
    @company.update(company_params)
    respond_with(@company, notice: "'#{@company.name}' company was successfully created ✅ 👏🏼")
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
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :details, :email, :website, :found_date, :company_logo)
    end
end