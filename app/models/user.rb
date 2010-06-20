require 'authlogic'

class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.validates_length_of_password_field_options = {:on => :update, :minimum => 4, :if => :require_password?}
    c.validates_length_of_password_confirmation_field_options = {:on => :update, :minimum => 4, :if => :require_password?}
  end
  
  belongs_to :owner, :polymorphic => true
  
  def worker?
    true unless owner_type != 'Worker'
  end
  
  def employer?
    true unless owner_type != 'Employer'
  end
  
  def guest?
    true unless owner_type && active
  end
  
  def activate!
    self.active = true
    save    
  end
  
  def deliver_activation_instructions!
    self.reset_perishable_token!
    ActivationMailer.deliver_activation_instructions(self)
  end
  
  def deliver_activation_confirmation!
     self.reset_perishable_token!
     ActivationMailer.deliver_activation_confirmation(self)
   end
end