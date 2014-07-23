module Admin
  class UserPolicy < Core::ApplicationPolicy
    class Scope < Struct.new(:user, :scope)
      def resolve
        scope.where(true)
      end
    end

    def update?
      user.is? :admin
    end
 
    def show?
      update?
    end
        
    def edit?
      update?
    end

    def destroy?
      update?
    end
    
    def index?
      update?
    end
    
    def create?
      update?
    end

    def new?
      update?
    end

  end
end
