class Contact < ApplicationRecord
  belongs_to :department
  validates_presence_of :name, :business_phone, :extension, :home_phone, :emergency_contact_name, :emergency_contact_phone
end
