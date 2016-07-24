require 'rails_helper'

RSpec.describe DepartmentsController, type: :controller do
  let(:department) { FactoryGirl.create(:department)}
  let(:user) { FactoryGirl.create(:user)}
  before(:each) do
    @user = User.find(department.user_id)
    sign_in @user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns departments instance variable" do
      get :index
      expect(assigns(:departments)).to eq([department])
    end

    it "render index template" do
      get :index
      expect(response).to render_template(:index) 
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: department.id
      expect(response).to have_http_status(:success)
    end

    it "assigns department instance variable" do
      get :show, id: department.id
      expect(assigns(:department)).to eq(department)
    end

    it "assigns user instance variable" do
      get :show, id: department.id
      expect(assigns(:user)).to eq(@user)
    end

    it "renders show template" do
      get :show, id: department.id
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "creates new department instance" do
      get :new
      new_dept = assigns(:department)
      expect(new_dept).to be_truthy
      expect(new_dept.id).to be_nil
    end
  end

  describe "GET #create" do
    before(:each) do
      @dept_params = { name: "dept name" }
      @failing_params = { name: nil }
      sign_out @user
      sign_in user
    end

    it "returns http redirect" do
      post :create, department: @dept_params
      expect(response).to have_http_status(302)
    end

    it "creates new department" do
      post :create, department: @dept_params
      expect(assigns(:department).id).to be_truthy
    end

    it "sets success flash message" do
      post :create, department: @dept_params
      expect(flash[:success]).to eq("Department Created")
    end

    it "sets fail flash message" do
      post :create, department: @failing_params
      expect(flash[:danger]).to eq(assigns(:department).errors.full_messages.join('<br />').html_safe)
    end
  end

end
