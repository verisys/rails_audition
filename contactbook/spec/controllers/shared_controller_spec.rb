require 'rails_helper'

RSpec.describe SharedController, type: :controller do
  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the home template" do
      get :home
      expect(response).to render_template(:home)
    end

  end
end
