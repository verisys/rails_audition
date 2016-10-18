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

require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "can create new instances" do 
    FactoryGirl.create :contact 
  end
end
