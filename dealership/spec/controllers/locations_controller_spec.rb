require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  let(:location) { FactoryGirl.create(:location)}

  describe "GET #index" do
    before(:each) do
      location
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns locations instance variable" do
      get :index
      expect(assigns(:locations)).to eq([location])
    end

    it "renders index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    before(:each) do
      get :show, id: location.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns location instance variable" do
      expect(assigns(:location)).to eq(location)
    end

    it "renders show template" do
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "creates new location instance" do
      get :new
      expect(assigns(:location)).to be_truthy
      expect(assigns(:location).id).to be_nil
    end

    it "renders new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #destroy" do
    before(:each) do
      post :destroy, id: location.id
    end

    it "returns http redirect" do
      expect(response).to have_http_status(302)
    end

    it "finds correct location" do
      expect(assigns(:location)).to eq(location)
    end

    it "deletes location" do
      expect(Location.count).to eq(0)
    end

    it "sets flash message" do
      expect(flash[:success]).to eq("Location Removed")
    end
  end

end
