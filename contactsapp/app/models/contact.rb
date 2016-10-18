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
#

class Contact < ApplicationRecord
  belongs_to :department

  validates_presence_of :department_id, :name, :home_phone, :emergency_contact_name, :emergency_contact_number

  def supervised_by? user
    d = department || Department.find(department_id)
    d.user == user
  end
end
