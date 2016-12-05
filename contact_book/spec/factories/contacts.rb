FactoryGirl.define do
  factory :contact do
    name "test contact"
    business_phone 1
    extension 1
    home_phone 1
    emergency_contact_name "test contact"
    emergency_contact_phone 1
    department
  end
end
