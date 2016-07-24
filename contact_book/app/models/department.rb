class Department < ApplicationRecord
  belongs_to :user
  has_many :contacts
  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false

  before_validation do |department|
  	department.name = department.name.titleize if department.name
  end
end
