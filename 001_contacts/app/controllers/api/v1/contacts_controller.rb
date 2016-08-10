class Api::V1::ContactsController < ApplicationController
  respond_to :json
  def list
    @contacts = Contact.all
    render json: @contacts
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
end
