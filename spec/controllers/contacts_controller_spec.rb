require 'factory_girl'
require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  before(:each) do
    @department = FactoryGirl.create(:department)
  end

  let(:valid_attributes) {
    {
      :department_id => @department.id,
      :name => 'Joe Hawkins',
      :business_phone => '801 555 1234',
      :home_phone => '801 999 1234',
      :emergency_contact_name => 'Wife Hawkins',
      :emergency_contact_phone => '801 747 1234'
    }
  }

  let(:invalid_attributes) {
    {
      :department => nil,
      :name => nil,
      :business_phone => 'a',
      :home_phone => 'b',
      :emergency_contact_name => nil,
      :emergency_contact_phone => 'c'
    }
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all contacts as @contacts' do
      contact = Contact.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:contacts)).to eq([contact])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested contact as @contact' do
      contact = Contact.create! valid_attributes
      get :show, id: contact.to_param, session: valid_session
      expect(assigns(:contact)).to eq(contact)
    end
  end

  describe 'GET #new' do
    it 'assigns a new contact as @contact' do
      get :new, params: {}, session: valid_session
      expect(assigns(:contact)).to be_a_new(Contact)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested contact as @contact' do
      contact = Contact.create! valid_attributes
      get :edit, id: contact.to_param, session: valid_session
      expect(assigns(:contact)).to eq(contact)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Contact' do
        expect {
          post :create, contact: valid_attributes, session: valid_session
        }.to change(Contact, :count).by(1)
      end

      it 'assigns a newly created contact as @contact' do
        post :create, contact: valid_attributes, session: valid_session
        expect(assigns(:contact)).to be_a(Contact)
        expect(assigns(:contact)).to be_persisted
      end

      it 'redirects to the created contact' do
        post :create, contact: valid_attributes, session: valid_session
        expect(response).to redirect_to(Contact.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved contact as @contact' do
        post :create, contact: invalid_attributes, session: valid_session
        expect(assigns(:contact)).to be_a_new(Contact)
      end

      it 're-renders the "new" template' do
        post :create, contact: invalid_attributes, session: valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        attributes = valid_attributes
        attributes[:name] = 'New Name'
        attributes
      }

      it 'updates the requested contact' do
        contact = Contact.create! valid_attributes
        put :update, id: contact.to_param, contact: new_attributes, session: valid_session
        contact.reload
        expect(contact.name).to_not eq(valid_attributes['name'])
      end

      it 'assigns the requested contact as @contact' do
        contact = Contact.create! valid_attributes
        put :update, id: contact.to_param, contact: valid_attributes, session: valid_session
        expect(assigns(:contact)).to eq(contact)
      end

      it 'redirects to the contact' do
        contact = Contact.create! valid_attributes
        put :update, id: contact.to_param, contact: valid_attributes, session: valid_session
        expect(response).to redirect_to(contact)
      end
    end

    context 'with invalid params' do
      it 'assigns the contact as @contact' do
        contact = Contact.create! valid_attributes
        put :update, id: contact.to_param, contact: invalid_attributes, session: valid_session
        expect(assigns(:contact)).to eq(contact)
      end

      it 're-renders the "edit" template' do
        contact = Contact.create! valid_attributes
        put :update, id: contact.to_param, contact: invalid_attributes, session: valid_session
        expect(response).to render_template('edit')
      end
    end
  end

end
