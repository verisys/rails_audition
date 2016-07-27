class Department < ApplicationRecord
  has_many :contacts, foreign_key: "contact_id"
  validates :name, presence: true, uniqueness: true

  scope :sales, -> { find_by_name('Sales').id }
  scope :support, -> { find_by_name('Support').id }
  scope :billing, -> { find_by_name('Billing').id }

  def name=(val)
      self[:name] = val.capitalize
  end
end
