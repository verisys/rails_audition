class Contact < ApplicationRecord
  belongs_to :department

  validates_presence_of :name, :department_id, :business_phone_number, :home_phone_number, :emergency_contact, :emergency_contact_phone_number
  validates :business_phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "must be a phone number (888-555-1234)" }
  validates :home_phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "must be a phone number (888-555-1234)" }
  validates :emergency_contact_phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "must be a phone number (888-555-1234)" }
end
