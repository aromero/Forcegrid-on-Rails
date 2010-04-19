# Archivo de datos seed

# Categorías
cat = Array.new
cat[0] = { :name => 'Servicios de Infraestructura', :description => 'Servicios de Infraestructura de IT' }
cat[1] = { :name => 'Desarrollo', :description => 'Desarrollo de aplicaciones y sitios web' }
categories = Category.create(cat)

# Subcategorías
sub_cat = Array.new
sub_cat[0] = { :name => 'ITIL', :description => 'Gestión de Backups', :category_id => categories[0].id }
sub_cat[1] = { :name => 'Virtualización', :description => 'Gestión de máquinas virtuales', :category_id => categories[0].id }
sub_cat[2] = { :name => 'Web', :description => 'Ruby on Rails', :category_id => categories[1].id }
sub_cat[3] = { :name => 'Desktop', :description => 'Python y Django', :category_id => categories[1].id }
subcategories = Category.create(sub_cat)

# Skills
skill = Array.new
skill[0] = { :name => 'Configuration Management', :category_id => subcategories[0].id }
skill[1] = { :name => 'Incident Management', :category_id => subcategories[0].id }
skill[2] = { :name => 'Provisioning', :category_id => subcategories[1].id }
skill[3] = { :name => 'Ruby on Rails', :category_id => subcategories[2].id }
skill[4] = { :name => 'Django', :category_id => subcategories[2].id }
skill[5] = { :name => 'Swing', :category_id => subcategories[2].id }
skill[6] = { :name => 'Windows forms', :category_id => subcategories[2].id }
skills = Skill.create(skill)

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