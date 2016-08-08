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
# sudo docker run -it -p 3000:3000 -v /vagrant:/usr/src/app rails
#  ? add bundle install into the Dockerfile
# go to localhost:3000 in your browser


# development
# vagrant ssh
# cd /vagrant
# sudo docker build -t rails .
# sudo docker run -it -p 3000:3000 -v /vagrant:/usr/src/app rails /bin/bash
# $ bundle install 
# $ rails s
