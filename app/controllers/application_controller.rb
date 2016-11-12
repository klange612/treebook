# Devise user authentication controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |params|
      params.permit(
        :email, :password, :password_confirmation, :first_name,
        :last_name, :profile_name
      )
    end
    devise_parameter_sanitizer.permit(:account_update) do |params|
      params.permit(
        :email, :password, :password_confirmation, :first_name,
        :last_name, :profile_name, :current_password
      )
    end
  end
end
