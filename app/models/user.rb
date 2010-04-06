require 'authlogic'

class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.validates_length_of_password_field_options = {:on => :update, :minimum => 4, :if => :require_password?}
    c.validates_length_of_password_confirmation_field_options = {:on => :update, :minimum => 4, :if => :require_password?}
  end
  
  has_one :employer, :dependent => :destroy
  has_one :worker, :dependent => :destroy
  accepts_nested_attributes_for :worker, :employer
  
  def worker?
    true unless self.worker.nil?
  end
  
  def employer?
    true unless self.employer.nil?
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
