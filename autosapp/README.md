# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.3.0

* System dependencies

    Database: postgresql

* Configuration

* Database creation

    postgresql must be installed on the system
    rake db:create
    rake db:migrate
    

* Database initialization

    The database is seeded using the seed file and "rake db:seed"
    
    

* How to run the test suite

    set up test db:   bin/rails db:migrate RAILS_ENV=test
    
    run the tests:  rake test test/
    
    note:  there is a bug in the rails 5/minitest code that causes the tests to all run twice if the minitest-autorun
    is included.  I've commented that line out of the test_helper.rb file but when they get this fixed (and I'm sure
    they will soon) it should probably be un-commented.
    

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* comments:

I used clearance, pundit and rolify to manage authentication and authorization to features.  I've never used clearance before
and it seemed like a light-weight solution (worth trying).  I usually use devise.  I did not spend time formatting
and cleaning up the views for the auth (other than the basic sign in form) and I did not plug in the email features 
for password management.  These things would be simple to accomplish.

I did not spend any time making the site responsive for smaller screens.  This was developed using Chrome on a full-sized
display.

I did not do a lot of testing.  Tests have been created to validate the ActiveRecord associations and to ensure that 
users with the correct roles in the system can only access the required pages/features which seemed to be the focus
of this audition project.   I hope that is sufficient.


------- 
There are not validations or required fields for contact information as there weren't any specific requirements
expressed.  If this were a production application I'd want to work with the product owner, or other team members,
to establish validators that were appropriate etc.  Model/unit tests would reflect the validators to ensure they
are enforced and no regression errors are introduced in subsequent development.

The form for creating and editing contacts is a simple scaffold form made by rails.  I would not leave it in 
this state but wanted to move on to the next site.  I would also integrate the bootstrap css helpers to
improve the appearance of the form.