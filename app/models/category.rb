class Category < ActiveRecord::Base
  validates_presence_of :name, :description
  
  has_many :skills
end