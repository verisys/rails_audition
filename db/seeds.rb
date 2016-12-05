supervisor_user = User.find_or_create_by(first_name: 'Admin') do |user|
  user.last_name = 'User'
end

Department.find_or_create_by(name: 'Department 1') do |department|
  department.supervisor = supervisor_user
  department.contacts = [
      Contact.new({ name: 'Contact 3',
                    business_phone: '801-444-5555',
                    home_phone: '801-666-7777',
                    emergency_contact_name: 'Contact Name',
                    emergency_contact_phone: '801-000-8888' })
  ]
end

Department.find_or_create_by(name: 'Department 2') do |department|
  department.contacts = [
      Contact.new({ name: 'Contact 1',
                      business_phone: '801-555-5555',
                      home_phone: '801-555-7777',
                      emergency_contact_name: 'Contact Name',
                      emergency_contact_phone: '801-555-8888' }),
      Contact.new({ name: 'Contact 2',
                      business_phone: '802-555-5555',
                      home_phone: '802-555-7777',
                      emergency_contact_name: 'Contact Name',
                      emergency_contact_phone: '802-555-8888' })
    ]
end
