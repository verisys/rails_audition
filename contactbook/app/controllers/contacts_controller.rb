class ContactsController < ApplicationController
	before_action :set_department

	def index
		@contacts = @department.contacts
	end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.department = @department
    if @contact.save
      flash[:success] = "Created new contact"
      redirect_to department_contacts_path(@department)
    else
      flash.now[:error] = "Failed to create contact"
      render :new
    end
	end

	def edit
    @contact = Contact.find(params[:id])
	end

	def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      flash[:success] = "Updated contact: " + @contact.name
      redirect_to department_contacts_path(@department)
    else
      flash.now[:error] = "Failed to update contact"
      render :edit
    end
	end

  def toggle_inactive
    @contact = Contact.find(params[:id])
    @contact.toggle!(:inactive)
    
    respond_to do |f|
      f.js
    end
  end

	private

	def set_department
		@department = Department.find(params[:department_id])
	end

	def contact_params
    params.require(:contact)
          .permit(:name, 
          	      :business_phone, 
          	      :business_extension,
          	      :home_phone,
          	      :emergency_contact_name,
          	      :emergency_contact_phone,
          	      :inactive)
	end

end
