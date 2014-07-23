require 'api/request_helper'

RSpec.configure do |config|
  config.include Api::Engine.routes.url_helpers
  config.include Requests::JsonHelpers, :type => :controller  
end
