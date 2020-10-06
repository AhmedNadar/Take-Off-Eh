require "application_responder"

class ApplicationController < ActionController::Base  
  self.responder = ApplicationResponder  
  respond_to :html

  protect_from_forgery with: :exception

  before_action :set_paper_trail_whodunnit
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, :password, :password_confirmation])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :first_name, :last_name, :password, :password_confirmation])
    end

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, alert: exception.message
    end
    
  private
    def after_sign_in_path_for(resource)
      flash[:notice] = "Welcome #{current_user.name} 😀 "
      dashboard_index_path
    end

    def after_sign_out_path_for(resource)
      flash[:notice] = "Goodbye for now, and come back again! 😀"
      root_path
    end

    def redirect_to_slug(action:, object:)
      redirect_to action: action, id: object.friendly_id, status: 301 unless object.friendly_id == params[:id]
    end         
end
