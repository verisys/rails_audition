class ContactsController < ApplicationController

  def index
      @contacts = Contact.all
  end


  def new
    @contact = Contact.new
  end


  def create
      if check_hash_values
        Contact.create(strong_params_helper)
      end

      redirect_to contacts_path
  end


  def edit
      @contact = Contact.find(params[:id])
  end


  def update
      contact = Contact.find(params[:id])
      if check_hash_values
        contact.update(strong_params_helper true)
      end
      redirect_to contacts_path
  end


  private


  # Returns 'true' if 'params' has some values in it's hash
  def check_hash_values
    hash = params[:contact].deep_dup
    hash.delete_if {|k, v| v == ""}
    !hash.empty?
  end


  def strong_params_helper(pass_active=nil)

      parameters = [:dept_name, :contact_name, :business_phone,
                    :business_extension, :home_phone, :emergency_contact,
                    :emergency_phone]
      if pass_active
          parameters << :active
          params.require(:contact).permit(*parameters)

      else
          params.require(:contact).permit(*parameters)
      end

  end

end
