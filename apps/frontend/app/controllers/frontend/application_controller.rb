require 'core/authentication'
require 'core/authorization'

module Frontend
  class ApplicationController < ActionController::Base
    include Core::Authentication
    include Core::Authorization

  end
end
