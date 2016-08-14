class Department < ActiveRecord::Base
  belongs_to :supervisor, class_name: 'User'
end
