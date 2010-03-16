class Job < ActiveRecord::Base
  belongs_to :employer
  has_one :bid
  
  validates_presence_of :title, :description, :start_time, :end_time, :budget

end
