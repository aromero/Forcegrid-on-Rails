class Employer < ActiveRecord::Base
  has_many :jobs
  has_many :bids, :through => :jobs
  has_one :user, :as => :owner
  
  validates_presence_of :first_name, :last_name, :company_name, :address1
  
  def full_name
    first_name + " " + last_name
  end
end
