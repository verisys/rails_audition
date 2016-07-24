class ContactsController < ApplicationController
  before_action :find_dept
  before_action :find_contact, except: [:index, :new, :create]

  def index
    @contacts = @department.contacts
  end

  def show
  end

  def new
  	@contact = Contact.new
  end

  def create
    contact = @department.contacts.new(contact_params)
    if contact.save
      flash[:success] = "Contact created"
      redirect_to department_contact_path(@department, contact)
    else
      flash[:danger] = @contact.errors.full_messages.join('<br />').html_safe
      render :new
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      flash[:success] = "Contact Updated"
      redirect_to department_contacts_path(@department)
    else
      flash[:danger] = @contact.errors.full_messages.join('<br />').html_safe
      render :edit
    end
  end

  def destroy
  end

  private

  def find_dept
    if params[:department_id]
      @department = Department.find(params[:department_id])
    elsif current_user && !!current_user.department
      @department = current_user.department
    else
      redirect_to new_department_path
    end
  end

  def find_contact
    @contact = @department.contacts.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :business_phone, :extension, :home_phone, :emergency_contact_name, :emergency_contact_phone, :active)
  end
end
