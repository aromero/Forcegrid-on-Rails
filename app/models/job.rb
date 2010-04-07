class Job < ActiveRecord::Base
  belongs_to :employer
  has_one :bid
  
  validates_presence_of :title, :description, :start_time, :end_time, :budget, :employer_id
  
  named_scope :current, :conditions => ['start_time < ? and end_time > ?', Time.now, Time.now]  
end
