require 'factory_girl'
require 'rails_helper'
require 'support/validation_examples'

RSpec.describe Contact, type: :model do
  subject { described_class.new }

  include_examples 'required attributes example', [:department, :name, :business_phone, :home_phone,
                                                   :emergency_contact_name, :emergency_contact_phone]

  it 'validates emergency contact phone is not the same as home and business phone' do
    contact = FactoryGirl.build(:contact)
    contact.emergency_contact_phone = contact.home_phone
    expect(contact).to_not be_valid
    contact.emergency_contact_phone = contact.business_phone
    expect(contact).to_not be_valid
    contact.emergency_contact_phone = '888-555-1111'
    expect(contact).to be_valid
  end

  it 'validates phone number format of home, business, and emergency_contact phone numbers' do
    [:home_phone, :business_phone, :emergency_contact_phone].each do |field|
      contact = FactoryGirl.build(:contact)
      contact[field] = 'a'
      expect(contact).to_not be_valid
    end
  end
end
