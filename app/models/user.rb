class User < ActiveRecord::Base
  devise :database_authenticatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, 
                  :owner_type, :owner_id, :admin
                  
  belongs_to :owner, :polymorphic => true
  has_many :authentications
  
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