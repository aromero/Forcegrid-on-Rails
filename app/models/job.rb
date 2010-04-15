class Job < ActiveRecord::Base
  belongs_to :employer
  belongs_to :category
  has_one :bid
  
  validates_presence_of :title, :description, :start_time, :end_time, :budget, :employer_id
  validate :time_interval
  
  validates_each :start_time, :end_time do |record, attr, value|
    record.errors.add attr, 'is in the past' unless value.future? || value.today?
  end
  
  def time_interval
    errors.add_to_base "End time must be greater than Start Time" if end_time.to_date <= start_time.to_date
  end
  
  named_scope :current, :conditions => ['start_time <= ? and end_time >= ?', Date.today, Date.today]
  
end