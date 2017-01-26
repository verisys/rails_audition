require 'spec_helper'

RSpec.describe CarsController, type: :controller do
  let(:location) { ::Location.new(name: "Jens Cars", street_address: "123 S Main", city: "SLC", state: "UT", zip_code: 84101) }
  let(:car) { ::Car.new(location_id: location.id, make: "Toyota", model: "Corolla", price: 10000, sold: false)}
  let(:car_params) {
    {
      make:"Ford",
      model: "Focus",
      price: 5000,
      sold: false,
      location_id: location.id
    }
  }

  before(:each) do
    location.save
    car.save
  end

  describe "GET #all_cars" do
    it "renders the index page" do
      get :all_cars
      expect(response).to render_template("cars/index")
    end

    it "returns all cars" do
      get :all_cars
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a car" do
      expect(::Car.count).to eq(1)
      post :create, car: car_params, location_id: location.id
      expect(::Car.count).to eq(2)
    end
  end

  describe "DELETE #destroy" do
    it "deletes a car" do
      expect(::Car.count).to eq(1)
      post :destroy, id: car.id, location_id: location.id
      expect(::Car.count).to eq(0)
    end
  end

  describe "GET #edit" do
    it "renders the edit page" do
      get :edit, id: car.id, location_id: location.id
      assert_template "cars/edit"
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
      assert_template 'cars/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "renders the show page" do
      get :show, id: car.id, location_id: location.id
      assert_template 'cars/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT update" do
    it "updates a car" do
      expect(car.make).to eq("Toyota")
      put :update, id: car.id, location_id: location.id, car: { make: "Nissan" }
      car.reload
      expect(car.make).to eq("Nissan")
    end
  end
end
