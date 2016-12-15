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

class Contact < ApplicationRecord

  def toggle_is_active(params)
    checked = params['checked'] == 'true'

    self.is_active = checked
    if self.save
      retval = "Success.  #{self.name} active status is now #{checked}"
    else
      retval = "Error setting active status for #{self.name} - [#{self.errors.full_messages}]"
    end
  end
end
