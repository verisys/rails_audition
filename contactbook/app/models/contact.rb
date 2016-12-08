class Contact < ApplicationRecord
  belongs_to :department
  validates_presence_of :name, 
  											:business_phone,
  											:business_extension,
  											:home_phone, 
  											:emergency_contact_name, 
  											:emergency_contact_phone

  validates :business_extension, uniqueness: { scope: :business_phone }
	validates :business_extension, numericality: { only_integer: true }


end