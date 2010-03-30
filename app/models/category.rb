class Category < ActiveRecord::Base
  validates_presence_of :name, :description
  
  has_many :skills
  has_many :subcategories
  has_many :subcategories, :class_name => 'Category', :foreign_key => 'category_id'
  
  named_scope :main, :conditions => { :category_id => nil }
  
end