class Bid < ActiveRecord::Base
  belongs_to :worker
  belongs_to :employer
  
  validates_presence_of :price, :pricing_method
end
