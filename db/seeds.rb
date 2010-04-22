# Archivo de datos seed

# Categorías
categories = Category.create(
    :name => 'Servicios de Infraestructura', :description => 'Servicios de Infraestructura de IT', 
    :name => 'Desarrollo', :description => 'Desarrollo de aplicaciones y sitios web')

# Subcategorías
subcategories = Category.create(
    :name => 'ITIL', :description => 'Gestión de Backups', :category_id => categories[0].id, 
    :name => 'Virtualización', :description => 'Gestión de máquinas virtuales', :category_id => categories[0].id, 
    :name => 'Web', :description => 'Desarrollo Web', :category_id => categories[1].id, 
    :name => 'Desktop', :description => 'Fat Clients', :category_id => categories[1].id)

# Skills
skills = Skill.create(
    :name => 'Configuration Management', :category_id => subcategories[0].id, 
    :name => 'Incident Management', :category_id => subcategories[0].id, 
    :name => 'Provisioning', :category_id => subcategories[1].id, 
    :name => 'Ruby on Rails', :category_id => subcategories[2].id, 
    :name => 'Django', :category_id => subcategories[2].id, 
    :name => 'Swing', :category_id => subcategories[3].id, 
    :name => 'Windows forms', :category_id => subcategories[3].id)

# Usuario administrador
admin = User.create(:email => 'fernando.parra@itparc.com', :password => 'itparc', :admin => true)
admin.activate!

# Worker
user1 = User.new(:email => 'ferparra83@gmail.com', :password => 'itparc')
user1.owner = Worker.new(:first_name => 'Fernando', :last_name => 'Parra', :address1 => 'Raffo 2976')
user1.owner.skills << skills[3]
user1.save
user1.activate!

# Employer
user2 = User.new(:email => 'accountvalidation@itparc.com', :password => 'itparc')
user2.owner = Employer.new(:first_name => 'Ariel', :last_name => 'Romero', :company_name => 'Microstrategy', :address1 => 'Alem 1000')
user2.save
user2.activate!

#Sample Job
job = Job.create(:title => 'Web Site', :description => 'Necesito un website',
      :start_time => 3.days.from_now, :end_time => 15.days.from_now,
      :employer_id => user2.id, :category_id => categories[1].id,
      :project_start => 17.days.from_now, :project_finish => 22.days.from_now)