require 'rails_helper'

RSpec.describe LocationsController do

  describe "GET index" do
    it "renders assigns @locations as @location" do
      location = Location.create(name: "Location")
      get :index

      expect(assigns(:location)).to eq([location])
    end
  end

  describe "POST create" do
    it "redirects to index" do
      post :create, { location: { name: "New Location" }}
      expect(response).to redirect_to(:index)
    end
  end
end
