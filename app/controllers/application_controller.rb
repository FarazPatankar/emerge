class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_filter  :verify_authenticity_token


  protected
  def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up).push :first_name, :last_name, :avatar, :bootcamp
	  devise_parameter_sanitizer.for(:account_update).push :first_name, :last_name, :avatar, :bootcamp
  end
end
