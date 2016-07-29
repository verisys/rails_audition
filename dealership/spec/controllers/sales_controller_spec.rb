require 'rails_helper'

RSpec.describe SalesController, type: :controller do

  describe "GET #sold" do
    it "returns http success" do
      get :sold
      expect(response).to have_http_status(:success)
    end
  end

end
