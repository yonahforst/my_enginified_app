require 'api/request_helper'

RSpec.configure do |config|
  config.include Core::Engine.routes.url_helpers
  config.include Requests::JsonHelpers, type: :request
  config.include Requests::AuthenticationHelpers, type: :request
end
