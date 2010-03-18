require 'authlogic'

class User < ActiveRecord::Base
  acts_as_authentic
  
  has_one :employer, :dependent => :nullify
  has_one :worker, :dependent => :nullify
  accepts_nested_attributes_for :worker, :employer, :allow_destroy => true
  accepts_nested_attributes_for :employer, :employer, :allow_destroy => true
end
