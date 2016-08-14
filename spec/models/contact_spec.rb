require 'rails_helper'
require 'support/validation_examples'

RSpec.describe Contact, type: :model do
  subject { described_class.new }

  include_examples 'required attributes example', [:department, :name, :business_phone, :home_phone,
                                                   :emergency_contact_name, :emergency_contact_phone]


end
