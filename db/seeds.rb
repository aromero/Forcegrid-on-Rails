# coding: utf-8
# Archivo de datos seed

# Categorías
categories = Category.create([
    { :name => 'Infraestructure services', :description => 'IT Infrastructure services' }, 
    { :name => 'Development', :description => 'App and web development' }])

# Subcategorías
subcategories = Category.create([
    { :name => 'ITIL', :description => 'Backup Management', :category_id => categories[0].id }, 
    { :name => 'Virtualization', :description => 'Virtual Machine Management', :category_id => categories[0].id }, 
    { :name => 'Web', :description => 'Web development', :category_id => categories[1].id }, 
    { :name => 'Desktop', :description => 'Fat Clients', :category_id => categories[1].id }])

# Skills
skills = Skill.create([
    { :name => 'Configuration Management', :category_id => subcategories[0].id }, 
    { :name => 'Incident Management', :category_id => subcategories[0].id }, 
    { :name => 'Provisioning', :category_id => subcategories[1].id }, 
    { :name => 'Ruby on Rails', :category_id => subcategories[2].id }, 
    { :name => 'Django', :category_id => subcategories[2].id }, 
    { :name => 'Swing', :category_id => subcategories[3].id }, 
    { :name => 'Windows forms', :category_id => subcategories[3].id }])

# Usuario administrador
admin = User.create(:email => 'fernando.parra@forcegrid.com', :password => 'forcegrid', :admin => true)
admin.activate!

# Worker
user1 = User.new(:email => 'ferparra83@gmail.com', :password => 'forcegrid')
user1.owner = Worker.new(:first_name => 'Fernando', :last_name => 'Parra', :address1 => 'Raffo 2976')
user1.owner.skills << skills[3]
user1.save
user1.activate!

# Employer
user2 = User.new(:email => 'accountvalidation@forcegrid.com', :password => 'forcegrid')
user2.owner = Employer.new(:first_name => 'Ariel', :last_name => 'Romero', :company_name => 'Microstrategy', :address1 => 'Alem 1000')
user2.save
user2.activate!

#Sample Job
job = Job.create(:title => 'Web Site', :description => 'I need a website',
      :start_time => 3.days.from_now, :end_time => 15.days.from_now,
      :employer_id => user2.owner.id, :category_id => Category.first.id,
      :project_begin => 17.days.from_now, :project_finish => 22.days.from_now, :budget => 10000.0)