class SupervisorsController < ApplicationController

	def login
		# assuming using company authentication
		# hard coding to first seeded supervisor instead of login
		# and authenticated routes
		@supervisor = Supervisor.find(1)
		@department = @supervisor.department
		redirect_to department_contacts_path(@department)
	end

end