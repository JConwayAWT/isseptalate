class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up){ |u| u.permit(:phone_number, :carrier, :password, :password_confirmation, :email)}
  end

  def after_sign_in_path_for(user)
    users_path
  end
end
