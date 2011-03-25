class Authentication < ActiveRecord::Base
  attr_accessible :user_id, :uid, :provider
  
  belongs_to :user
end
