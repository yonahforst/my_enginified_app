require 'core/authentication'
require 'core/authorization'

module Core
  class ApplicationController < ActionController::Base
    include Core::Authentication
    include Core::Authorization


    layout 'core/application'
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      params = [:first_name, :last_name, :email, :password, :password_confirmation, :current_password]
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(params) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(params) }
    end
  end
end
