class IndustriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_industry, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @industries = Industry.all
    respond_with(@industries)
  end

  def show
    respond_with(@industry)
  end

  def new
    @industry = Industry.new
    respond_with(@industry)
  end

  def edit
  end

  def create
    @industry = Industry.new(industry_params)
    @industry.user_id = current_user.id
    @industry.save
    respond_with(@industry)
  end

  def update
    @industry.update(industry_params)
    respond_with(@industry)
  end

  def destroy
    @industry.destroy
    respond_with(@industry)
  end

  private
    def set_industry
      @industry = Industry.find(params[:id])
    end

    def industry_params
      params.require(:industry).permit(:name)
    end
end
