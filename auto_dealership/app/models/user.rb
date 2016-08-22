class User < ActiveRecord::Base
	belongs_to :vehicle
	belongs_to :position
end
