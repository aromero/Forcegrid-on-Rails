class User < ActiveRecord::Base
  devise :database_authenticatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, 
                  :owner_type, :owner_id, :admin
                  
  belongs_to :owner, :polymorphic => true
  
  def self.find_for_oauth(access_token, signed_in_resource=nil)
    user_info = access_token['user_info']
    if user = User.find_by_email(user_info['email'])
      user
    else # Create an user with a stub password. 
      User.create!(:email => user_info["email"], :password => Devise.friendly_token[0,20]) 
    end
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