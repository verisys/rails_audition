namespace :populate do
  desc "Creates 5 users and 10 contacts per user"
  task users_and_contacts: :environment do
    User.create(email: 'bob@example.com', password: 'password', department: 'IT')
    User.create(email: 'fred@example.com', password: 'password', department: 'Support')
    User.create(email: 'tiffany@example.com', password: 'password', department: 'Accounting')
    User.create(email: 'sarah@example.com', password: 'password', department: 'Operations')
    User.create(email: 'michelle@example.com', password: 'password', department: 'HR')

    User.all.each do |user|
      10.times do
        user.contacts.create(
          department: user.department,
          name: Faker::Name.name,
          business_phone: Faker::PhoneNumber.cell_phone,
          extension: Faker::PhoneNumber.extension,
          home_phone: Faker::PhoneNumber.cell_phone,
          emergency_contact_phone: Faker::PhoneNumber.cell_phone,
          emergency_contact_name: Faker::Name.name
        )
      end
    end

  end

end
