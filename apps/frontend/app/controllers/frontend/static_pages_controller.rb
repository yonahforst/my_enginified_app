module Frontend
  class StaticPagesController < ApplicationController
    skip_before_filter :authenticate_user!
    skip_before_filter :load_and_authorize_resource
    
    layout 'core/application'
    
    def about
    end
    
  end
end
