class Worker < ActiveRecord::Base
  has_many :bids
  has_many :employers, :through => :bids
  belongs_to :user
  
  has_many :skill_workers
  has_many :skills, :through => :skill_workers
  
  validates_presence_of :first_name, :last_name
  
  def full_name
    first_name + " " + last_name
  end
end
