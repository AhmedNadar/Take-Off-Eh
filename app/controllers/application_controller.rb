class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :first_name, :last_name, :full_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :first_name, :last_name, :full_name])
    end

  private
    def after_sign_in_path_for(resource)
      flash[:notice] = "Welcome #{current_user.name} 😀"
      root_path
    end

    def after_sign_out_path_for(resource)
      flash[:notice] = "Goodbye for now, and come back again! 😀"
      root_path
    end
      
end
