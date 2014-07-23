module Core
  class User < ActiveRecord::Base
    ROLES = %w[landlord tenant admin]
        
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :confirmable,
           :recoverable, :rememberable, :trackable, :validatable,
           :simple_token_authenticatable

   
   validates :first_name, :last_name, presence: :true
   validates :email, uniqueness: :true

    def full_name
      "#{first_name} #{last_name}"
    end
    
    def roles=(roles)
      self.roles_mask = (roles.map(&:to_s) & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
    end

    def roles
      ROLES.reject do |r|
        ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
      end
    end
    
    def is?(role)
      roles.include?(role.to_s)
    end

  end
end
