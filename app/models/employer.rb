class Employer < ActiveRecord::Base
  has_many :jobs
  
  def full_name
    first_name + " " + last_name
  end
end
