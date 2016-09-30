json.extract! contact, :id, :name, :business_phone, :home_phone, :extension, :department_id, :em_contact_name, :em_contact_num, :created_at, :updated_at
json.url contact_url(contact, format: :json)