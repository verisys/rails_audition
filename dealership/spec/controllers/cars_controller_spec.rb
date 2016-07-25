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

  describe "POST #create" do
    before(:each) do
      @passing_params = { make: "a", model: "a", price: "1" }
      @failing_params = { make: nil }
    end

    it "returns http redirect" do
      post :create, location_id: @location.id, car: @passing_params
      expect(response).to have_http_status(302)
    end

    it "assigns car instance variable" do
      post :create, location_id: @location.id, car: @passing_params
      expect(assigns(:car)).to be_truthy
      expect(assigns(:car).make).to eq(@passing_params[:make]) 
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
end




