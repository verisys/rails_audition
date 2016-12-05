require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "attributes" do
  	it { should belong_to :department }
  end

  describe "validations" do
  	it { should validate_presence_of :name }
  	it { should validate_presence_of :business_phone }
  	it { should validate_presence_of :extension }
  	it { should validate_presence_of :home_phone }
  	it { should validate_presence_of :emergency_contact_name }
  	it { should validate_presence_of :emergency_contact_phone }
  end
end
