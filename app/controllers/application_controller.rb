class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include CanCan::ControllerAdditions
  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to static_pages_home_url
  end

  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(
          :email, :password, :password_confirmation, :full_name, :address, :phone_number
      )
    end
  end
end
