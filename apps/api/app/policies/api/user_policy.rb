module Api
  class UserPolicy < Core::ApplicationPolicy
    class Scope < Struct.new(:user, :scope)
      def resolve
        scope.where(id: user.id)
      end
    end

    def update?
      user.id == record.id || user.is?(:admin)
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
      false
    end
    
    def create?
      false
    end

    def new?
      false
    end

  end
end
