require 'core/authentication'
require 'core/authorization'
module Api
  module V1
    class ApplicationController < ActionController::Base

      include Core::Authentication
      include Core::Authorization
     
    end
  end
end
