class UsersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :admin_only, :except => :show

  def index
    @users = User.all
  end

  def show
    unless current_user.admin?
      unless @user == current_user
        redirect_to root_path, :alert => "Access denied."
      end
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy    
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  # def admin_only
  #   unless :admin?
  #     redirect_to root_path, :alert => "Access denied."
  #   end
  # end
  
    def set_user
      @user = User.friendly.find(params[:id])
    end

  def user_params
    params.require(:user).permit(:role)
  end

end