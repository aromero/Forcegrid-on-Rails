require 'authlogic'

class User < ActiveRecord::Base
  belongs_to :employer
  belongs_to :worker
  
  acts_as_authentic
end
