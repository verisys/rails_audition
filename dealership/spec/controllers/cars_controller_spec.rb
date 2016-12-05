require 'rails_helper'

RSpec.describe CarsController, type: :controller do
  let(:car) { FactoryGirl.create(:car) }
  before(:each) do
    @location = Location.find(car.location_id)
  end

  describe "GET #index" do
    before(:each) do
      get :index, location_id: @location.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns location instance variable" do
      expect(assigns(:location)).to eq(@location)
    end

    it "assigns cars instance variable" do
      expect(assigns(:cars)).to eq([car])
    end

    it "renders index template" do
      expect(response).to render_template(:index)
    end
  end

  describe "GET #all_cars" do
    before(:each) do
      car
      get :all_cars
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns cars instance variable" do
      expect(assigns(:cars)).to eq(Car.all)
    end

    it "renders all_cars template" do
      expect(response).to render_template(:all_cars)
    end
  end

  describe "GET #show" do
    before(:each) do
      get :show, location_id: @location.id, id: car.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns location instance variable" do
      expect(assigns(:location)).to eq(@location)
    end

    it "assigns car instance variable" do
      expect(assigns(:car)).to eq(car)
    end

    it "renders show template" do
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    before(:each) do
      get :new, location_id: @location.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns location instance variable" do
      expect(assigns(:location)).to eq(@location)
    end

    it "creates new car instance" do
      expect(assigns(:car)).to be_truthy
      expect(assigns(:car).id).to be_nil
    end

    it "renders new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    before(:each) do
      @passing_params = { make: "a", model: "a", price: "1" }
      @failing_params = { make: nil }
    end

    it "returns http redirect" do
      post :create, location_id: @location.id, car: @passing_params
      expect(response).to have_http_status(302)
    end

    it "creates a new car" do
      post :create, location_id: @location.id, car: @passing_params
      expect(Car.last.make).to eq(@passing_params[:make]) 
    end

    it "sets success flash message" do
      post :create, location_id: @location.id, car: @passing_params
      expect(flash[:success]).to eq("Car Added")
    end

    it "sets fail flash message" do
      post :create, location_id: @location.id, car: @failing_params
      expect(flash[:danger]).to eq(assigns(:car).errors.full_messages.join('<br />').html_safe)
    end
  end

  describe "GET #edit" do
    before(:each) do
      get :edit, location_id: @location.id, id: car.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns car instance variable" do
      expect(assigns(:car)).to eq(car)
    end

    it "assigns locations instance variable" do
      expect(assigns(:locations)).to eq(Location.all)
    end

    it "renders edit template" do
      expect(response).to render_template(:edit)
    end
  end

  describe "GET #sell" do
    before(:each) do
      get :sell, location_id: @location.id, car_id: car.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns car instance variable" do
      expect(assigns(:car)).to eq(car)
    end

    it "renders the sell template" do
      expect(response).to render_template(:sell)
    end
  end

  describe "PUT #update" do
    let(:salesman) { FactoryGirl.create(:salesman)}
    before(:each) do
      sign_in salesman
      @sell_params = {sale_price: 1}
      @location_2 = Location.create(address_line_1: "l2", address_line_2: "a", city: "a", state: "a", zip_code: "1")
    end

    it "returns http redirect" do
      put :update, location_id: @location.id, id: car.id, car: @sell_params
      expect(response).to have_http_status(302)
    end

    it "finds correct car" do
      put :update, location_id: @location.id, id: car.id, car: @sell_params
      expect(assigns(:car)).to eq(car)
    end

    it "marks car as sold" do
      put :update, location_id: @location.id, id: car.id, car: @sell_params
      expect(assigns(:car).sold).to eq(true)
    end

    it "sets flash message for sell" do
      put :update, location_id: @location.id, id: car.id, car: @sell_params
      expect(flash[:success]).to eq("Congrats on the sale!")
    end

    it "updates car's location" do
      put :update, location_id: @location.id, id: car.id, car: {location: @location_2.id}
      expect(assigns(:car).reload.location).to eq(@location_2)
    end

    it "sets location change flash message" do
      put :update, location_id: @location.id, id: car.id, car: {location: @location_2.id}
      expect(flash[:success]).to eq("Car Moved")
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      delete :destroy, location_id: @location.id, id: car.id
    end

    it "returns http redirect" do
      expect(response).to have_http_status(302)
    end

    it "finds correct car" do
      expect(assigns(:car)).to eq(car)
    end

    it "deletes car" do
      expect(Car.count).to eq(0)
    end
  end 
end




