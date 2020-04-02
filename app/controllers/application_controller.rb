class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception 
  # before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller? 
  

  def after_sign_in_path_for(resource_or_scope)
    provider = Provider.find_by(user_id: current_user.id)
    if provider
      return root_path
    end
    
  end

  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation, :contact, :dob, :image ) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:firstname, :lastname, :email, :password, :current_password, :password_confirmation, :contact, :dob, :image ) }
  end

end
