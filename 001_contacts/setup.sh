#/bin/bash

sudo apt-get update
sudo apt-get -y install docker.io

# bootstrap
# cd /vagrant
# sudo docker build -t rails .
# sudo docker run -v /vagrant:/usr/src/app rails rails new contact_book --api

# run
# vagrant ssh
# cd /vagrant
# sudo docker build -t rails .
# sudo docker run -it -p 3000:3000 rails
# go to localhost:3000 in your browser


# development
# vagrant ssh
# cd /vagrant
# sudo docker build -t rails .
# sudo docker run -it -p 3000:3000 -v /vagrant:/usr/src/app rails


# rails generate model Contact 
# rake db:migrate
# rails g serializer Contacts

# GET api/v1/contacts/   <-- list contacts
# POST api/v1/contact/   <-- add a contact
# GET api/v1/contacts/:id  <-- get a contact
# PUT api/v1/contacts/:id  <-- replace item
# GET api/v1/contacts?dept=:dept <-- get all values from a department
