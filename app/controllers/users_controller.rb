class UsersController < ApplicationController
  
  # before_action :authenticate_user!
  # before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :admin_only, :except => :show

  def index
    @users = User.all
  end
  
  def show
    @user = User.friendly.find(params[:id])
    @companies = @user.companies
    # @blogs     = @user.blogs
    if signed_in?
      unless current_user.admin?
        unless @user == current_user
          redirect_to root_path, :alert => "Access denied."
        end
      end
    else
      redirect_to root_path, :alert => "Access denied."
    end

  end

end