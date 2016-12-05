class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :deactivate]
  before_action :set_department, only: [:new, :create]

  # GET /contacts
  # GET /contacts.json
  def index
    @current_user = current_user
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @contact.department = @department
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts/1/deactivate
  # POST /contacts/1/deactivate.json
  def deactivate
    @contact.active = false

    respond_to do |format|
      if @contact.save
        format.html { redirect_to action: :index, notice: 'Contact was successfully deactivated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :show }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    @contact.department = @department

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def set_department
      @department = Department.find_by(supervisor_id: current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:department_id, :name, :business_phone, :home_phone, :emergency_contact_name, :emergency_contact_phone)
    end
end
