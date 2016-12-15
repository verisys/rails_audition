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
    
    The database is empty to begin with.  it could be intialized with a seed file. The use case calls for the ability to add contacts so that is how the db will be set up if we don't want to use a seed file.
    

* How to run the test suite

    set up test db:   bin/rails db:migrate RAILS_ENV=test
    
    run the tests:  rake test test/
    

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* comments:

The application has a single page to cover the use cases requested.  Contacts can be added, updated, 
deleted etc (CRUD).  The combo box allows the user to filter by department and the checkbox for is_active
allows the user to easily set the active status for a contact using a simple AJAX call.
I did not use any JS framework to accomplish the table filtering, just simple javascript.

I did not write any tests for the javascript code

There are not validations or required fields for contact information as there weren't any specific requirements
expressed.  If this were a production application I'd want to work with the product owner, or other team members,
to establish validators that were appropriate etc.  Model/unit tests would reflect the validators to ensure they
are enforced and no regression errors are introduced in subsequent development.

The form for creating and editing contacts is a simple scaffold form made by rails.  I would not leave it in 
this state but wanted to move on to the next site.  I would also integrate the bootstrap css helpers to
improve the appearance of the form.

