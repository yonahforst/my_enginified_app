module Core
  class RegistrationsController < Devise::RegistrationsController
    prepend_before_filter :authenticate_scope!, only: [:edit, :update, :destroy, :show]
    
    def show
      authenticate_scope!
      respond_with resource
    end

    # By default we want to require a password checks on update.
    # You can overwrite this method in your own RegistrationsController.
    def update_resource(resource, params)

      # required for settings form to submit when password is left blank
      if params[:password].blank?
        params.delete("password")
        params.delete("password_confirmation")
      end
      
      if needs_password?(resource, params)
        return resource.update_with_password(params)
      else
        # remove the virtual current_password attribute
        # update_without_password doesn't know how to ignore it
        params.delete('current_password')
        return resource.update_without_password(params)
      end
    end

    # check if we need password to update resource data
    # ie if password or email was changed
    # extend this as needed
    def needs_password?(resource, params)
      params[:email] && (params[:email] != resource.email)  ||
        params[:password].present? ||
        params[:password_confirmation].present?
    end
    
  end
end




