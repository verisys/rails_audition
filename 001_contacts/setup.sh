#/bin/bash

sudo apt-get update
sudo apt-get -y install docker.io

# bootstrap
# cd /vagrant
# sudo docker build -t rails .
# sudo docker run -v /vagrant:/usr/src/app rails rails new contact_book --api

# make docker container
# cd /vagrant
# sudo docker build -t rails .
# ...

# development
# cd /vagrant
# sudo docker run -it -p 3000:3000 -v /vagrant:/usr/src/app rails /bin/bash
# $ bundle install 
# $ rails s
