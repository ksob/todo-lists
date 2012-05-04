class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  before_save :setup_role
   
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end

  # Default role is "Member"
  def setup_role 
    if self.role_ids.empty?     
      self.role_ids = [1]
    end
  end
end
