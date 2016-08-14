class Contact < ActiveRecord::Base
  validates_presence_of :department, :name, :business_phone, :home_phone,
                        :emergency_contact_name, :emergency_contact_phone

  belongs_to :department
end
