# == Schema Information
#
# Table name: contacts
#
#  id                       :integer          not null, primary key
#  department_id            :integer
#  name                     :string
#  business_phone           :string
#  home_phone               :string
#  emergency_contact_name   :string
#  emergency_contact_number :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  active                   :boolean          default(TRUE)
#

FactoryGirl.define do
  factory :contact do
    department
    name {Faker::Name.name}
    business_phone {Faker::PhoneNumber.phone_number}
    home_phone {Faker::PhoneNumber.cell_phone}
    emergency_contact_name {Faker::Name.name}
    emergency_contact_number {Faker::PhoneNumber.cell_phone}
    active true
  end
end
