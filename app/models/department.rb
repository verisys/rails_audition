class Department < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :supervisor_id

  belongs_to :supervisor, class_name: 'User'
  has_many :contacts
end
