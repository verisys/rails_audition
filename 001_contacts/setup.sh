#/bin/bash

sudo apt-get update
sudo apt-get -y install docker.io

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
