class Department < ActiveRecord::Base
	belongs_to :supervisor
	has_many :contacts
end
