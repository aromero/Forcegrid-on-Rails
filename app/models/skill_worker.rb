class SkillWorker < ActiveRecord::Base
  belongs_to :worker
  belongs_to :skill
end
