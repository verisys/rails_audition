namespace :bootstrap do
  desc "Add a default Sales department "
  task :default_departments => :environment do
    Department.create( :name => 'Sales' )
    Department.create( :name => 'Billing')
    Department.create( :name => 'Support' )
  end

   desc "Add a default Sales manager"
   task :default_managers => :environment do
     Contact.create( :name => 'Sales Manager', :department_id => 1 )
     Contact.create( :name => 'Billing Manager', :department_id => 2 )
     Contact.create( :name => 'Support Manager', :department_id => 3 )
     Contact.create( :name => 'Alt Sales Manager', :department_id => 1 )
   end

   desc "Create a default Sales contact"
   task :default_contacts => :environment do
     Contact.create( :name => 'Sales Contact', :manager_id => 1, :department_id => 1 )
     Contact.create( :name => 'Billing Contact', :manager_id => 2, :department_id => 2 )
     Contact.create( :name => 'Support Contact', :manager_id => 3, :department_id => 3 )
     Contact.create( :name => 'Alt Sales', :manager_id => 4, :department_id => 1 )
   end

   desc "Run all bootstrapping tasks"
   task :all => [:default_departments, :default_managers, :default_contacts]
 end
