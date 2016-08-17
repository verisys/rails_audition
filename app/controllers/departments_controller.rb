class DepartmentsController < ApplicationController

  # GET departments/1/contacts
  # GET departments/1/contacts.json
  def contacts
    @department = Department.find(params[:id])
    @contacts = @department.contacts
    @current_user = current_user

    respond_to do |format|
        format.html
        format.json { render :template => 'contacts/index' }
    end
  end
end
