class Job < ActiveRecord::Base
  belongs_to :employer
  belongs_to :category
  has_one :assigment
  has_many :bids
  has_many :employers, :through => :assigments
  has_many :milestones
  
  validates_presence_of :title, :description, :start_time, 
      :end_time, :budget, :employer_id, 
      :category_id, :project_begin, :project_finish
      
  validates_exclusion_of :state, :in => 'archived', :message => 'Job has finalized and can\'t be modified'
  validate :time_interval, :project
  
  validates_each :start_time, :end_time do |record, attr, value|
    record.errors.add attr, 'is in the past' unless value.future? || value.today?
  end
  
  def time_interval
    errors.add_to_base 'No ending date must be prior to the starting date' \
       if (end_time.to_date <= start_time.to_date) || (project_finish.to_date <= project_begin.to_date)
  end
  
  def project
    #TO-DO ver por qué no funciona
    #unless project_start > 2.days.from_now
    #  errors.add_to_base 'All projects must start after the finalizing date for a job'
    #end
  end
  
  named_scope :current, :conditions => ['start_time <= ? and end_time >= ?', Date.today, Date.today], :include => [:bids]
  
  state_machine :state, :initial => :draft do
    event :publish do
      transition :draft => :published
    end
    
    #TO-DO generar nuevo Project (en tabla projects)
    event :execute do
      transition :published => :ongoing
    end
    event :finish do
      transition :ongoing => :archived
    end
  end
  
  def self.search(search)
    current.find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
  end
end