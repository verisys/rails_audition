class Api::V1::ContactsController < ApplicationController
  respond_to :json
  # currently only searching based on dept is working
  def list
    department = params[:dept]
    if department
      @contacts = Contact.where(dept: department)
      render json: @contacts
    else
      @contacts = Contact.all
      render json: @contacts
    end
  end
  def get
    @contact = Contact.find(params[:id])
    render json: @contact
  end
  def add
    @contact = Contact.new(params[:contact])
    if @contact.save
      render json: @contact, status: :created
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end
  def update
    @contact = Contact.find(params[:id])
    
    if @contact.update_attributes(params[:contact])
      head :no_content
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end
end
