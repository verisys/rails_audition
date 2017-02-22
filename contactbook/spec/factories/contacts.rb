require 'faker'

FactoryGirl.define do
  factory :contact do
    trait :department do
      department
    end
    name { Faker::Name.name }
    business_phone { Faker::PhoneNumber.cell_phone }
    extension { Faker::PhoneNumber.extension }
    home_phone { Faker::PhoneNumber.cell_phone }
    emergency_contact_name { Faker::Name.name }
    emergency_contact_phone { Faker::PhoneNumber.cell_phone }
    user
  end
end
