module Api
  class User < Core::User
    def self.policy_class
      UserPolicy
    end
  end
end
