class Worker < ActiveRecord::Base
  has_many :bids
  has_many :employers, :through => :bids
  has_one :user, :as => :owner
  
  has_many :assigments
  has_many :jobs, :through => :assigments
  
  has_many :skill_workers
  has_many :skills, :through => :skill_workers
  accepts_nested_attributes_for :skill_workers, :allow_destroy => true
  
  validates_presence_of :first_name, :last_name
  
  def full_name
    first_name + " " + last_name
  end
end
