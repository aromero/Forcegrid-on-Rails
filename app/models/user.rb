class User < ActiveRecord::Base
  devise :database_authenticatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, 
                  :owner_type, :owner_id, :admin
                  
  belongs_to :owner, :polymorphic => true
  has_many :authentications, :dependent => :destroy
    
  # Validar que tenga owner si el usuario no es admin
  #validates_presence_of :owner_type, :on => :create, :if => Proc.new {|user| !user.admin }
  
  def apply_omniauth(omniauth)
    self.password = Devise.friendly_token[0,20] if self.password.blank?
    self.email = omniauth['user_info']['email'] if self.email.blank?
    self.authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end
  
  def worker?
    true unless owner_type != 'Worker'
  end
  
  def employer?
    true unless owner_type != 'Employer'
  end
  
  def guest?
    true unless owner_type
  end
  
  def admin?
    true unless !admin
  end
end