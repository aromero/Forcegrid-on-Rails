class Assigment < ActiveRecord::Base
  belongs_to :job
  belongs_to :worker
  validates_presence_of :job_id, :worker_id
end
