require 'factory_girl'

FactoryGirl.define do
  factory :contact do
    department
    sequence(:name) { |n| "Contact #{n}" }
    business_phone '801-555-5555'
    home_phone '801-555-7777'
    emergency_contact_name 'Contact Name'
    emergency_contact_phone '801-555-8888'
  end

  factory :department do
    association :supervisor, factory: :user
    sequence(:name) { |n| "Department #{n}" }
  end

  factory :user do
    sequence(:first_name) { |n| "User #{n}" }
    last_name 'Last'
  end
end