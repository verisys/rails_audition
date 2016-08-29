class ContactsController < ApplicationController

  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
    @departments = Department.all
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save
    redirect_to contacts_url, notice: 'Contact successfully created'
  end

  def update
    @contact.update(contact_params)
    redirect_to contacts_url, notice: 'Contact successfully updated'
  end

  def edit
  end

  def show
  end

  def destroy
    @contact.destroy
    redirect_to contacts_url, notice: 'Contact successfully deleted'
  end

  private
    #only allow specified parameters
    def contact_params
      params.require(:contact).permit(:name, :extension, :home_phone, :business_phone, :department_id,
                                      :emergency_contact_name, :emergency_contact_number, :active)
    end

    #set the contact by id
    def set_contact
      @contact = Contact.find(params[:id])
    end

end