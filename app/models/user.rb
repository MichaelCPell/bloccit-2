class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  has_many :posts 
  before_create :set_member


  #CanCan roles
  ROLES = %w[member, moderator, admin]
  def role?(base_role)
  	role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
  

  private 
  
  def set_member
    self.role = 'member'
  end
end