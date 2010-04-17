# Archivo de datos seed

# Categorías
cat = []
cat[0] = { :name => 'Servicios de Infraestructura', :description => 'Servicios de Infraestructura de IT' }
cat[1] = { :name => 'Desarrollo Web', :description => 'Desarrollo de aplicaciones y sitios web' }
categories = Category.create(cat)

# Subcategorías
sub_cat = []
sub_cat[0] = { :name => 'Backups', :description => 'Gestión de Backups', :category_id => categories[0].id }
sub_cat[1] = { :name => 'Virtualización', :description => 'Gestión de máquinas virtuales', :category_id => categories[0].id }
sub_cat[2] = { :name => 'Rails', :description => 'Ruby on Rails', :category_id => categories[1].id }
sub_cat[3] = { :name => 'Python', :description => 'Python y Django', :category_id => categories[1].id }
subcategories = Category.create(sub_cat)

# Usuario administrador
admin = User.create(:email => 'fernando.parra@itparc.com', :password => 'itparc', :admin => true)
admin.activate!

# Worker
user1 = User.new(:email => 'ferparra83@gmail.com', :password => 'itparc')
user1.owner = Worker.new(:first_name => 'Fernando', :last_name => 'Parra', :address1 => 'Raffo 2976')
user1.save
user1.activate!

# Employer
user2 = User.new(:email => 'accountvalidation@itparc.com', :password => 'itparc')
user2.owner = Employer.new(:first_name => 'Ariel', :last_name => 'Romero', :company_name => 'Microstrategy', :address1 => 'Alem 1000')
user2.save
user2.activate!