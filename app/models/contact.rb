class Contact < ActiveRecord::Base
  validates_presence_of :department, :name, :business_phone, :home_phone,
                        :emergency_contact_name, :emergency_contact_phone
  validate :check_emergency_contact_phone
  validates :business_phone, :home_phone, :emergency_contact_phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "Invalid phone number (ex: 000-000-0000)" }
  belongs_to :department

private
  def check_emergency_contact_phone
    errors.add(:emergency_contact_phone, "can't be the same as business_phone") if emergency_contact_phone == business_phone
    errors.add(:emergency_contact_phone, "can't be the same as home_phone") if emergency_contact_phone == home_phone
  end
end
