require 'spec_helper'

RSpec.describe EmployeesController, type: :controller do
  let(:location) { ::Location.new(name: "Jens Cars", street_address: "123 S Main", city: "SLC", state: "UT", zip_code: 84101) }
  let(:employee) { ::Employee.new(location_id: location.id, name: "Sam", role: "sales")}
  let(:employee_params) {
    {
      name: "John",
      role: "sales",
      location_id: location.id
    }
  }

  before(:each) do
    location.save
    employee.save
  end

  describe "GET #all_employees" do
    it "renders the index page" do
      get :all_employees
      expect(response).to render_template("employees/index")
    end

    it "returns all employees" do
      get :all_employees
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates an employee" do
      expect(::Employee.count).to eq(1)
      post :create, employee: employee_params, location_id: location.id
      expect(::Employee.count).to eq(2)
    end
  end

  describe "DELETE #destroy" do
    it "deletes an employee" do
      expect(::Employee.count).to eq(1)
      post :destroy, id: employee.id, location_id: location.id
      expect(::Employee.count).to eq(0)
    end
  end

  describe "GET #edit" do
    it "renders the edit page" do
      get :edit, id: employee.id, location_id: location.id
      assert_template "employees/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns a success" do
      get :index, location_id: location.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it "renders the new page" do
      get :new, location_id: location.id
      assert_template 'employees/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "renders the show page" do
      get :show, id: employee.id, location_id: location.id
      assert_template 'employees/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT update" do
    it "updates an employee" do
      expect(employee.name).to eq("Sam")
      put :update, id: employee.id, location_id: location.id, employee: { name: "Sammy" }
      employee.reload
      expect(employee.name).to eq("Sammy")
    end
  end
end
