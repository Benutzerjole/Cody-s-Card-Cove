class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[name email password address province_id city
                                               zip_code phone_number])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name email password current_password address
                                               province_id city zip_code phone_number])
  end
end
