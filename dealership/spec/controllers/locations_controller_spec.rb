require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  let(:location) { FactoryGirl.create(:location)}
  let(:user) { FactoryGirl.create(:user)}
  before(:each) do
    sign_in user
  end

  describe "GET #index" do
    before(:each) do
      location
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns locations instance variable" do
      expect(assigns(:locations)).to eq([location])
    end

    it "renders index template" do
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

  describe "POST #create" do
    before(:each) do
      @passing_params = { address_line_1: "a", address_line_2: "a", city: "a", state: "a", zip_code: "1" }
      @failing_params = { address_line_1: nil }
    end

    it "returns http redirect" do
      post :create, location: @passing_params
      expect(response).to have_http_status(302)
    end

    it "creates new location" do
      post :create, location: @passing_params
      expect(Location.last.city).to eq(@passing_params[:city])
    end

    it "sets success flash message" do
      post :create, location: @passing_params
      expect(flash[:success]).to eq("Location Added")
    end

    it "sets fail flash message" do
      post :create, location: @failing_params
      expect(flash[:danger]).to eq(assigns(:location).errors.full_messages.join('<br />').html_safe)
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
