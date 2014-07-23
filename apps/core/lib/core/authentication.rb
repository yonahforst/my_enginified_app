module Core
  module Authentication
    extend ActiveSupport::Concern

    included do
      # acts_as_token_authentication_handler_for Core::User
      # This is our new function that comes before Devise's one
      # before_action :authenticate_user_from_token!
      before_action :authenticate_user!
    end
 
 
    private

    # def authenticate_user_from_token!
    #   token = request.headers["X-User-Token"]
    #   email = request.headers["X-User-Email"]
    #   puts token
    #   puts email
    #   return unless token && email
    #
    #   user_email = email.presence
    #   user       = user_email && User.find_by_email(user_email)
    #   puts user
    #   if user && Devise.secure_compare(user.authentication_token, token)
    #     sign_in user, store: false
    #   end
    # end
    
    
    #
    # layout :layout_by_resource
    #
    # protected
    #
    # def layout_by_resource
    #   if devise_controller?
    #     "layouts/core/devise"
    #   else
    #     "layouts/core/application"
    #   end
    # end

  end
end
