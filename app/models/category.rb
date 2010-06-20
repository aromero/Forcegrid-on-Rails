class Category < ActiveRecord::Base
  validates_presence_of :name, :description
  
  has_one :job
  has_many :skills
  has_many :subcategories
  has_many :subcategories, :class_name => 'Category', :foreign_key => 'category_id'
  
  scope :main, :conditions => { :category_id => nil }
  
end