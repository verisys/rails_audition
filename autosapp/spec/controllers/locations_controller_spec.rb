require 'spec_helper'

RSpec.describe LocationsController, type: :controller do
  let(:location) { ::Location.new(name: "Jens Cars", street_address: "123 S Main", city: "SLC", state: "UT", zip_code: 84101) }
  let(:location_params) {
    {
      name: "Johns Cars",
      street_address: "234 S Main",
      city: "SLC",
      state: "UT",
      zip_code: 84101,
    }
  }

  before(:each) do
    location.save
  end

  describe "POST #create" do
    it "creates a location" do
      expect(::Location.count).to eq(1)
      post :create, location: location_params
      expect(::Location.count).to eq(2)
    end
  end

  describe "DELETE #destroy" do
    it "deletes a location" do
      expect(::Location.count).to eq(1)
      post :destroy, id: location.id
      expect(::Location.count).to eq(0)
    end
  end

  describe "GET #edit" do
    it "renders the edit page" do
      get :edit, id: location.id
      assert_template "locations/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns a success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it "renders the new page" do
      get :new
      assert_template 'locations/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "renders the show page" do
      get :show, id: location.id
      assert_template 'locations/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT update" do
    it "updates a location" do
      expect(location.name).to eq("Jens Cars")
      put :update, id: location.id, location: { name: "Sams Cars" }
      location.reload
      expect(location.name).to eq("Sams Cars")
    end
  end
end
