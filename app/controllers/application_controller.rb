class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_logged_in?
  
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:edit, keys: [:name])
    end
    
  def user_logged_in?
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
