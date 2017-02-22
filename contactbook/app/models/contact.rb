class Contact < ApplicationRecord
  belongs_to :user

  validates_presence_of :department, :name, :emergency_contact_name, :emergency_contact_phone

  def self.departments
    self.select(:department).map(&:department).uniq
  end

end
