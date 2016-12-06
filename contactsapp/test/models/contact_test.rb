# == Schema Information
#
# Table name: contacts
#
#  id                :integer          not null, primary key
#  dept              :string
#  name              :string
#  business_phone    :string
#  business_ext      :string
#  home_phone        :string
#  emergency_contact :string
#  emergency_number  :string
#  is_active         :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # TODO I have not made any validations, they should be checked here to make sure they are being enforced properly


end
