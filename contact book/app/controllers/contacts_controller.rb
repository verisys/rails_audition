class ContactsController < ApplicationController

  def index
      @contacts = Contact.all
  end


  def new
    @contact = Contact.new
  end


  def create
      Contact.create(strong_params_helper)
      redirect_to contacts_path
  end


  def edit
      @contact = Contact.find(params[:id])
  end


  def update
      contact = Contact.find(params[:id])
      contact.update(strong_params_helper true)
      redirect_to contacts_path
  end


  private


  def strong_params_helper(is_active=nil)

      parameters = [:dept_name, :contact_name, :business_phone,
                    :business_extension, :home_phone, :emergency_contact,
                    :emergency_phone]
      if is_active
          parameters << :active
          params.require(:contact).permit(*parameters)

      else
          params.require(:contact).permit(parameters)
      end

  end

end
