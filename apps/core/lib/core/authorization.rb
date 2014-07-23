module Core
  module Authorization
    extend ActiveSupport::Concern

    included do
      # after_action :verify_authorized
      
      include Pundit
      rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    end
    
    def load_and_authorize_resource **options
      load_resource options
      authorize_resource options
    end
    
    def authorize_resource **options
      resource_name = options[:class_name] || controller_path
      simple_resource_name = resource_name.camelize.demodulize.tableize
      
      case action_name
      when 'index'
        authorize instance_variable_get("@#{simple_resource_name}")
      else
        authorize instance_variable_get("@#{simple_resource_name.singularize}")
      end
    end
    
    def load_resource **options
      resource_name = options[:class_name] || controller_path.camelize
      resource_class = resource_name.classify.constantize
      simple_resource_name = resource_name.demodulize.tableize
      finder_param = options[:find_by] || :id
      
      case action_name
      when 'index'
        instance_variable_set "@#{simple_resource_name}", policy_scope(resource_class)
      when 'new' || 'create'
        instance_variable_set "@#{simple_resource_name.singularize}", resource_class.new
      else
        instance_variable_set "@#{simple_resource_name.singularize}", resource_class.find_by(finder_param.to_sym => params[:id])
      end
    end

    private

    def user_not_authorized
      respond_to do |format|
        format.js do
          render :json => {error: 'Unauthorized'}, status: :unauthorized
        end
        format.all do
          flash[:error] = "You are not authorized to perform this action."
          redirect_to (request.referrer || main_app.root_path)
        end
      end
    end
    
 
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
