# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.3.0

* System dependencies

    Database: postgresql
    
    Authentication: Clearance gem
    
    Authorization: Rolify & Pundit

* Configuration

There are 5 users and 3 locations in the seed file.  admin@dealership.com, owner@dealership.com, inventory@dealership.com, 
sales1@dealership.com and sales2@dealership.com.   The password for each is the word "password".  Obviously I 
would never use that password in a production system.  (I'd have a validation that doesn't allow that).

* Database creation

    postgresql must be installed on the system
    
    rake db:create
    
    rake db:migrate
    

* Database initialization

    The database is seeded using the seed file and "rake db:seed"  I have built a csv file to seed the vehicles in the 
    system for demonstration purposes.
    
    

* How to run the test suite

    set up test db:   bin/rails db:migrate RAILS_ENV=test
    
    run the tests:  rake test
    
    note:  there is a bug in the rails 5/minitest code that causes the tests to all run twice if the minitest-autorun
    is included.  I've commented that line out of the test_helper.rb file but when they get this fixed (and I'm sure
    they will soon) it should probably be un-commented.
    
    I wrote tests to cover access to features for the location controller.  This should ensure that only an owner user
    can see the locations and perform maintenance on them.  These types of tests should also be used to ensure
    authorization is properly enforced for the other user roles and the other features of the application.  I did not
    implement all the different variations of tests on the other controllers for the sake of time in this audition.  
    Production code would require that.
    

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* comments:

I used clearance, pundit and rolify to manage authentication and authorization to features.  I've never used clearance before
and it seemed like a light-weight solution (worth trying).  I usually use devise.  I did not spend time formatting
and cleaning up the views for the auth (other than the basic sign in form) and I did not plug in the email features 
for password management.  These things would be simple to accomplish.


I did not spend any time making the site responsive for smaller screens.  This was developed using Chrome on a full-sized
display.


I did not add fields to the user model (like name or demographic data).  A production system would have this done so the 
 reporting etc would show the user name instead of the email address (which is what I'm doing)
 

The requirements called for pages to allow the specific users to do some operations (sell a car, change the location etc.)
I opted to add that functionality where I could to the index page to make it easier to use and less cumbersome.
the different pages could certainly be done if that were the preference, but I thought this was a cleaner design. 
In a production application I would interact with the product owner before making design changes/decisions like this
unless they were very light-weight, in which case I would do a proof of concept and then give them the opportunity
to see the idea in action.


I did not do a lot of testing.  Tests have been created to validate the ActiveRecord associations and to ensure that 
users with the correct roles in the system can only access the required pages/features which seemed to be the focus
of this audition project.   I hope that is sufficient.


The main pages etc asked for in the requirements are implemented and the UI is somewhat cleaned up.  There are a number
of views etc that came out of the scaffolding that I did not spend time formatting but they are not part of the spec
and not accessible without manually setting the path in the URL.  I opted to not remove them but if they were not going
to be used in a production app I would do so...


I did not spend time formatting the forms for new and update actions on each model.  The forms work functionally
but I would clean them up and add the bootstrap form CSS if this were a production project.

 
These use cases weren't covered but on the inventory page I would add search capabilities and the ability
 to sort on each column (or at least the price, location and model columns)


I did not create any validations on the models.  This is something I would add for a production system to 
ensure that the data is valid for emails, phone numbers, prices etc.  I would also add regex validations
on the client side forms to try and catch problems prior to submission for a better user experience.


I did not allow users to share roles because of how the exercise was worded - for example, The owner and the 
inventory manager cannot sell a vehicle.  Only a sales person can sell the car.  Etc.


I added a sales report page (menu option 'sales') that shows the sales for the current user if the user is
a salesman and for the whole company if the user is the owner.  Thought it made sense to do something like this.
This report could be expanded quite a bit - ability to group the sales data by location, by salesman (for owner report),
order by sale price... etc.  I did not do this for the audition.

My original design included a status field for the vehicles but this has become obsolete during development and
is a tougher field to maintain and keep valid.  My next step on this project would be to remove that field and 
ensure that all the tests etc pass - and ensure that nothing is using the vehicle.status field, displaying it etc.