# 001_contacts Coding Audition

## Instructions to run

1. Install Vagrant and Virtualbox on your machine
2. Clone the repo rails_audition repo
3. Change directories to the location of the cloned repo into the 001_contacts directory
```
$ cd rails_audition/001_contacts
```
4. Launch the Vagrant vm
```
$ vagrant up
```
5. SSh into the vm
```
$ vagrant ssh
```
6. Change directories to the mounted project directory in the vm
```
$ cd /vagrant
```
7. Build the docker container for rails
```
$ sudo docker build -t rails .
```
8. Run the container
```
$ sudo docker run -it -p 3000:3000 rails
```
9. On you host machine navigate to the index page
```
http://localhost:3000
```