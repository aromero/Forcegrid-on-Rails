# coding: utf-8
# Archivo de datos seed
require 'open-uri'

# Categorías
cat_file = File.join(Rails.root, 'db', 'categories.yml')

YAML::load_file(cat_file).each do |cat|
  category = Category.new cat
  category.save!
end

# Skills
doc = Nokogiri::HTML(open('http://www.elance.com/skills'))
skills = doc.css('.skills-section a').map(&:text)
skills.each{|s| Skill.create(:name => s)}

# Usuario administrador
admin = User.create(:email => 'dev@forcegrid.com', :password => 'forcegrid', :admin => true)
admin.save

# Worker
user1 = User.new(:email => 'fparra@forcegrid.com', :password => 'forcegrid')
user1.owner = Worker.new(:first_name => 'Fernando', :last_name => 'Parra', :address1 => 'Raffo 2976')
# TODO: agregar skills
#user1.owner.skills << skills[3]
user1.save

# Employer
user2 = User.new(:email => 'accountvalidation@forcegrid.com', :password => 'forcegrid')
user2.owner = Employer.new(:first_name => 'Ariel', :last_name => 'Romero', :company_name => 'Microstrategy', :address1 => 'Alem 1000')
user2.save