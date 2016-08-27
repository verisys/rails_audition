class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @department = Department.find(params[:department_id])
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @contact.department_id = params[:department_id]
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to department_contacts_path(@contact.department, @contact), notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    if @contact.update(contact_params)
      redirect_to [@contact.department, @contact], notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:department_id, :name, :business_phone_number, :business_phone_extension, :home_phone_number, :emergency_contact, :emergency_contact_phone_number)
    end
end
