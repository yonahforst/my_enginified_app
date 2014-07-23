module Requests
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body).with_indifferent_access if response.body
    end
  end
  
  module AuthenticationHelpers
    def basic_auth(email, password)
      credentials = ActionController::HttpAuthentication::Basic.encode_credentials(email, password)
      {'HTTP_AUTHORIZATION' => credentials}
    end
  end
end