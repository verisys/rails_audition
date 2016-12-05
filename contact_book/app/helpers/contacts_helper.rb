module ContactsHelper
	def can_edit?(contact)
		contact.department == current_user.department
	end
end
