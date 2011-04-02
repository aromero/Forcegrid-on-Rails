class Employer < ActiveRecord::Base
  has_many :jobs
  has_many :bids, :through => :jobs
  has_one :user, :as => :owner
  
  validates_presence_of :full_name, :company_name, :address1
  accepts_nested_attributes_for :jobs    
end
