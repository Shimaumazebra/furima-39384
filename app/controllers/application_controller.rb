class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :date_of_birth])
  end
end
