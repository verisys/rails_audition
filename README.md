# 001_contacts Coding Audition

## Instructions to run

* Install Vagrant and Virtualbox on your machine
* Clone the repo rails_audition repo
* Change directories to the location of the cloned repo into the 001_contacts directory
```
$ cd rails_audition/001_contacts
```
* Launch the Vagrant vm
```
$ vagrant up
```
* SSh into the vm
```
$ vagrant ssh
```
* Change directories to the mounted project directory in the vm
```
$ cd /vagrant
```
* Build the docker container for rails
```
$ sudo docker build -t rails .
```
* Run the container
```
$ sudo docker run -it -p 3000:3000 rails
```
* On you host machine navigate to the index page
```
http://localhost:3000
```