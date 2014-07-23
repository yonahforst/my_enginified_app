require 'core/authentication'
require 'core/authorization'

module Admin
  class ApplicationController < ActionController::Base
    include Core::Authentication
    include Core::Authorization
    before_action :load_and_authorize_resource
    
    layout 'core/application'
    
    
    private

  end
end
