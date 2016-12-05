class Contact < ActiveRecord::Base
  attr_accessible :name, :dept, :business_phone, :business_phone_ext, :home_phone, :emerg_contact_name, :emerg_contact_number, :active
end
