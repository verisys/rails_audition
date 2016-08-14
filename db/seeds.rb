supervisor_user = User.find_or_create_by(first_name: 'Joe') do |user|
  user.last_name = 'Hawkins'
end

Department.find_or_create_by(name: 'Department 1') do |department|
  department.supervisor = supervisor_user
end

Department.find_or_create_by(name: 'Department 2')
