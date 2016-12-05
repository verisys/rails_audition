#!/bin/bash

# Get all contacts
curl -i -XGET 'http://localhost:3000/api/v1/contacts'

# Get all contacts that match the query value
curl -i -XGET 'http://localhost:3000/api/v1/contacts?dept=Sales'

# Get one contact
curl -i -XGET 'http://localhost:3000/api/v1/contacts/1'

# Add contact
curl -i -H 'Content-Type: application/json' -XPOST 'http://localhost:3000/api/v1/contacts' -d '{
       "contact": {"name":"George Washington",
                     "dept":"Sales",
                     "business_phone":"555-555-5555",
                     "business_phone_ext":"555",
                     "home_phone":"555-555-5554",
                     "emerg_contact_name":"Jennifer Ard",
                     "emerg_contact_number":"555-555-5553",
                     "active":true}}'

# Edit contact
curl -i -H 'Content-Type: application/json' -XPUT 'http://localhost:3000/api/v1/contacts/1' -d '{
       "contact": {"name":"Joe Shmo",
                     "dept":"Engineering",
                     "business_phone":"555-555-5555",
                     "business_phone_ext":"555",
                     "home_phone":"555-555-5554",
                     "emerg_contact_name":"Jennifer Ard",
                     "emerg_contact_number":"555-555-5553",
                     "active":true}}'
