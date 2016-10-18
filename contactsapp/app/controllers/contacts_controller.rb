class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: [:show, :edit, :update, :destroy, :toggle_active]


  # GET /contacts
  # GET /contacts.json
  def index
    di = params[:department_id] || params[:q][:department_id_eq] rescue nil
    @department =  di.present? ? Department.find(di) : nil
    scope = @department ? Contact.where(department_id: di) : Contact.unscoped
    @search = scope.ransack(params[:q])
    @search.sorts = 'name asc' if @search.sorts.empty?
    @contacts = @search.result.page(params[:page]).per(20)
  end

  def toggle_active 
    raise "Cannot edit Contact belonging to unsupervised Department" unless @contact.supervised_by?(current_user)
    @contact.active = !@contact.active 
    @contact.save!
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
    raise "Cannot edit Contact belonging to unsupervised Department" unless @contact.supervised_by?(current_user)
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    raise "Cannot add Contact to unsupervised Department" unless @contact.supervised_by?(current_user)
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
    raise "Cannot update Contact belonging to unsupervised Department" unless @contact.supervised_by?(current_user)
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

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    raise "Cannot destroy Contact belonging to unsupervised Department" unless @contact.supervised_by?(current_user)
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
      params.require(:contact).permit(:department_id, :name, :business_phone, :home_phone, :emergency_contact_name, :emergency_contact_number)
    end
end
