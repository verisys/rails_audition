require 'rails_helper'
require 'pry'
describe ContactsController, type: :controller do

  login_user

  describe 'User is created' do
    it 'should have a user' do
      expect(@user).to_not eq(nil)
    end
  end

  describe 'GET index' do
    before(:each) do
      @contact = FactoryGirl.create(:contact)
      get :index
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'sets the contacts instance variable' do
      get :index
      expect(assigns(:contacts)).to eq(@user.contacts)
    end
  end

  describe 'GET show' do
    before(:each) do
      @contact = FactoryGirl.create(:contact)
      get :show, params: { id: @contact.id }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'sets the contact instance variable' do
      expect(assigns(:contact)).to eq(@contact)
    end
  end

  describe 'GET edit' do
    before(:each) do
      @contact = FactoryGirl.create(:contact)
      get :edit, params: { id: @contact.id }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end

    it 'sets the contact instance variable' do
      expect(assigns(:contact)).to eq(@contact)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'sets new contact instance variable' do
      get :new
      expect(assigns(:contact)).to_not be(:nil)
      expect(assigns(:contact).class).to eq(Contact)
    end
  end

  describe 'POST create' do

    context 'with all required fields' do
      before(:each) do
        post :create, params: { contact: { department: @user.department, name: 'garrett stott', business_phone: '8018361367',
                                           extension: '12', home_phone: '8018361368', emergency_contact_name: 'Brenda Stott',
                                           emergency_contact_phone: '8018361369' } }
        @contact = Contact.last
      end

      it 'successfully creates a contact' do
        expect(Contact.count).to eq(1)
      end

      it 'redirects to contact on success create' do
        expect(response).to redirect_to(contact_path(@contact))
      end
    end

    context 'without a name' do
      before(:each) do
        post :create, params: { contact: { department: @user.department, name: nil, business_phone: '8018361367',
                                           extension: '12', home_phone: '8018361368', emergency_contact_name: 'Brenda Stott',
                                           emergency_contact_phone: '8018361369' } }
        @contact = Contact.last
      end

      it 'fails to create a contact without a name' do
        expect(Contact.count).to eq(0)
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end
    end

  end

  describe 'PUT update' do
    before(:each) do
      @contact = FactoryGirl.create(:contact)
      @name = @contact.name
    end

    context 'with updated name' do
      before(:each) do
        put :update, params: { id: @contact.id, contact: { department: @contact.department, name: 'Bob', business_phone: @contact.business_phone,
                                           extension: @contact.extension, home_phone: @contact.home_phone, emergency_contact_name: @contact.emergency_contact_name,
                                           emergency_contact_phone: @contact.emergency_contact_phone } }
      end

      it 'updated contact successfully' do
        expect(@contact.reload.name).to eq('Bob')
      end

      it 'redirects to show path on success' do
        expect(response).to redirect_to(contact_path(@contact))
      end
    end

    context 'with no name' do
      before(:each) do
        put :update, params: { id: @contact.id, contact: { department: @contact.department, name: '', business_phone: @contact.business_phone,
                                           extension: @contact.extension, home_phone: @contact.home_phone, emergency_contact_name: @contact.emergency_contact_name,
                                           emergency_contact_phone: @contact.emergency_contact_phone } }
      end

      it 'renders the edit template on fail' do
        expect(response).to render_template(:edit)
      end

      it 'does not update contact on fail' do
        expect(@contact.reload.name).to eq(@name)
      end
    end
  end

  describe 'DELETE destroy' do
    before(:each) do
      @contact = FactoryGirl.create(:contact)
      expect(Contact.count).to eq(1)
      delete :destroy, params: { id: @contact.id }
    end

    it 'deletes the contact' do
      expect(Contact.count).to eq(0)
    end

    it 'redirects to contacts index on success' do
      expect(response).to redirect_to(contacts_path)
    end
  end

  describe 'PUT active' do
    before(:each) do
      @contact = FactoryGirl.create(:contact)
      expect(@contact.active).to eq(true)
      put :active, params: { id: @contact.id }
    end

    it 'deactivates the contact' do
      expect(@contact.reload.active).to eq(false)
    end

    it 'redirects to show path' do
      expect(response).to redirect_to(contact_path(@contact))
    end
  end

  describe 'PUT by_department' do
    before(:each) do
      @contact = FactoryGirl.create(:contact)
      put :by_department, params: { department: 'IT' }
    end

    it 'renders the index page' do
      expect(response).to render_template(:index)
    end

    it 'sets the contacts instance variable' do
      expect(assigns(:contacts)).to_not eq(nil)
      expect(assigns(:contacts).first.department).to eq('IT')
    end
  end

end
