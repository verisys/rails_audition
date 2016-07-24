class Department < ApplicationRecord
  belongs_to :user
  has_many :contacts
  validates_presence_of :name
  validates_uniqueness_of :name

  before_validation do |department|
  	department.name = department.name.titleize
  end
end
