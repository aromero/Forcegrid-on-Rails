class Bid < ActiveRecord::Base
  belongs_to :worker
  belongs_to :job
  
  validates_presence_of :price, :pricing_method, :worker_id, :job_id
end
