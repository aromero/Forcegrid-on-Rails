class Milestone < ActiveRecord::Base
  # fields: title, description, start_date, end_date, budget_porcentage
  belongs_to :job
  
  validates_presence_of :title, :description, :start_date, :end_date
end
