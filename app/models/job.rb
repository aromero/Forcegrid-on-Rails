class Job < ActiveRecord::Base
  belongs_to :employer
  
  belongs_to :category
  has_one :assigment
  has_many :bids
  has_many :employers, :through => :assigments
  has_many :milestones
  accepts_nested_attributes_for :milestones, :reject_if => proc { |attributes| attributes['title'].blank? }
  
  validates_presence_of :title, :description, :start_time, 
        :end_time, :budget, :category_id, :project_begin, :project_finish
        
  validate :time_interval
  
  validates_each :start_time, :end_time do |record, attr, value|
    record.errors.add attr, 'is in the past' unless value.future? || value.today?
  end
  
  def time_interval
    errors.add_to_base 'No ending date must be prior to the starting date' \
       if (end_time.to_date <= start_time.to_date) || (project_finish.to_date <= project_begin.to_date)
  end
  
  scope :current, :conditions => ['start_time <= ? and end_time >= ?', Date.today, Date.today], :include => [:bids]
  
  def self.search(search)
    current.all.where(['title LIKE ?', "%#{search}%"])
  end
end