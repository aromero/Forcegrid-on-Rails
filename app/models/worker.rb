class Worker < ActiveRecord::Base
  has_many :bids
  has_many :employers, :through => :bids
  belongs_to :user
  
  validates_presence_of :first_name, :last_name
  
  def full_name
    first_name + " " + last_name
  end
end
