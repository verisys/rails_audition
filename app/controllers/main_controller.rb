class MainController < ApplicationController
  #before_filter :authenticate_admin, :only => [:restart]

  def restart
    f = File.new("#{Rails.root}/tmp/restart.txt", "w")
    f.close
    redirect_to root_url
  end

	def contact_directory
	  @contacts = Contacts.active.order_by(id: :acs)
  end

	def all_contacts
	  @contacts = Contacts.order_by(id: :acs)
  end
end
