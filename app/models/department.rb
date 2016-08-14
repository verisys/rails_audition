class Department < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :supervisor, class_name: 'User'
end
