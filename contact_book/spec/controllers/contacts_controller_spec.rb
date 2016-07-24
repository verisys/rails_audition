require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  let(:contact) { FactoryGirl.create(:contact)}
  before(:each) do
    @department = Department.find(contact.department_id)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, department_id: @department.id
      expect(response).to have_http_status(:success)
    end

    it "assigns contacts instance variable" do
      get :index, department_id: @department.id
      expect(assigns(:contacts)).to eq([contact])
    end

    it "renders index template" do
      get :index, department_id: @department.id
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, department_id: @department.id, id: contact.id
      expect(response).to have_http_status(:success)
    end

    it "assigns contact instance variable" do
      get :show, department_id: @department.id, id: contact.id
      expect(assigns(:contact)).to eq(contact)
    end

    it "renders show template" do
      get :show, department_id: @department.id, id: contact.id
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, department_id: @department.id
      expect(response).to have_http_status(:success)
    end

    it "creates new contact instance" do
      get :new, department_id: @department.id
      new_contact = assigns(:contact)
      expect(new_contact).to be_truthy
      expect(new_contact.id).to be_nil
    end

    it "renders the new template" do
      get :new, department_id: @department.id
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    before(:each) do
      @contact_params = { name: "name", business_phone: 2, extension: 2, home_phone: 2, emergency_contact_name: "name", emergency_contact_phone: 2}
      @failing_params = { name: nil }
    end

    it "returns http redirect" do
      post :create, contact: @contact_params, department_id: @department.id
      expect(response).to have_http_status(302)
    end

    it "sets success flash message" do
      post :create, contact: @contact_params, department_id: @department.id
      expect(flash[:success]).to eq('Contact created')
    end

    it "sets fail flash message" do
      post :create, contact: @failing_params, department_id: @department.id
      expect(flash[:danger]).to eq(assigns(:contact).errors.full_messages.join('<br />').html_safe)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, department_id: @department.id, id: contact.id
      expect(response).to have_http_status(:success)
    end

    it "finds correct contact" do
      get :edit, department_id: @department.id, id: contact.id
      expect(assigns(:contact)).to eq(contact)
    end

    it "renders the edit template" do
      get :edit, department_id: @department.id, id: contact.id
      expect(response).to render_template(:edit)
    end
  end

  describe "GET #update" do
    before(:each) do
      @contact_params = { name: "name", business_phone: 2, extension: 2, home_phone: 2, emergency_contact_name: "name", emergency_contact_phone: 2}
      @failing_params = { name: nil }
    end

    it "returns http redirect" do
      put :update, contact: @contact_params, department_id: @department.id, id: contact.id
      expect(response).to have_http_status(302)
    end

    it "updates the contact" do
      put :update, contact: @contact_params, department_id: @department.id, id: contact.id
      expect(assigns(:contact).name).to eq(@contact_params[:name])
    end

    it "sets success flash message" do
      put :update, contact: @contact_params, department_id: @department.id, id: contact.id
      expect(flash[:success]).to eq("Contact Updated")
    end

    it "sets fail flash message" do
      put :update, contact: @failing_params, department_id: @department.id, id: contact.id
      expect(flash[:danger]).to eq(assigns(:contact).errors.full_messages.join("<br />").html_safe)
    end
  end

end
