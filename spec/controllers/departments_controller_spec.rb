require 'factory_girl'
require 'rails_helper'

RSpec.describe DepartmentsController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @department_1 = FactoryGirl.create(:department)
    department_2 = FactoryGirl.create(:department)

    FactoryGirl.create_list(:contact, 3, department: @department_1)
    FactoryGirl.create(:contact, department: department_2)
  end

  let(:valid_session) { { user_id: @user.id } }

  describe 'GET #contacts' do
    it 'assigns only contacts in department as @contacts' do
      get :contacts, id: @department_1.id, session: valid_session
      expect(assigns(:contacts)).to eq(Contact.where(department_id: @department_1.id))
    end

    it 'assigns selected department as @department' do
      get :contacts, id: @department_1.id, session: valid_session
      expect(assigns(:department)).to eq(@department_1)
    end
  end

end
