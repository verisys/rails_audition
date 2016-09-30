class Department < ActiveRecord::Base
	has_one :supervisor
end
