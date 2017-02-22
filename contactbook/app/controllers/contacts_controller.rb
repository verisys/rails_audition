class ContactsController < ApplicationController
  before_action :set_supervisor, :authenticate_user!
  before_action :set_contact, only: [:show, :edit, :update, :destroy, :active]

  def index
    @contacts = Contact.where(department: @supervisor.department)
  end

  def show
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      flash[:success] = "Contact #{@contact.name} Updated"
      redirect_to contact_path(@contact)
    else
      flash.now[:error] = "Contact #{@contact.name} was not updated. " + @contact.errors.full_messages.to_sentence
      render :edit
    end
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = current_user.contacts.new(contact_params)
    if @contact.save
      flash[:success] = "Contact #{@contact.name} Saved"
      redirect_to contact_path(@contact)
    else
      flash.now[:error] = "Contact #{@contact.name} was not saved. " + @contact.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    contact = @contact
    @contact.destroy
    flash[:success] = "Deleted #{contact.name}"
    redirect_to contacts_path
  end

  def active
    @contact.update(active: !@contact.active)
    flash[:success] = "#{@contact.active ? 'Activated' : 'Deactivated'} #{@contact.name}"
    redirect_back(fallback_location: contact_path(@contact))
  end

  def by_department
    redirect_to department_path(department: params[:department])
  end

  def department
    @department = params[:department]
    @contacts = Contact.where(department: @department)
    render :index
  end

  private

  def contact_params
    params.require(:contact).permit(:department, :name, :business_phone, :extension, :home_phone, :emergency_contact_phone, :emergency_contact_name)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def set_supervisor
    @supervisor = current_user
  end
end
