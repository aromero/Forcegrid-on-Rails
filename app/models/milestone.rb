class Milestone < ActiveRecord::Base
  belongs_to :job
  
  validates_presence_of :title, :description, :start_date, :end_date
end
