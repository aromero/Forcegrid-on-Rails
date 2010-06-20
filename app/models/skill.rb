class Skill < ActiveRecord::Base
  belongs_to :category
  
  has_many :skill_workers
  has_many :workers, :through => :skill_workers
end
