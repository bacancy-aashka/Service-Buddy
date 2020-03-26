class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception 
  # before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_data

  before_action :configure_permitted_parameters, if: :devise_controller? 

  private

  def invalid_data
    redirect_to '/'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation, :contact, :dob ) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:firstname, :lastname, :email, :password, :current_password, :password_confirmation, :contact, :dob ) }
  end

end
