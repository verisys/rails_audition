require 'rails_helper'

RSpec.describe "Vehicles", type: :request do
  before do
    location1 = Location.create(address: 'Test address')
    Vehicle.create(make: 'Test', model: 'Animal', list_price: 20_000, location_id: location1.id, sold: false)
    user = User.create(
        :name => "Name",
        :email => "Email1@email.com",
        position: 'salesman',
        password: 'password',
        password_confirmation:'password'
      )
    post login_path, params: { session: { email: user.email, password: user.password } }
  end
  describe "GET /vehicles" do
    it "gets vehicles" do
      get vehicles_path
      expect(response).to have_http_status(200)
    end
  end
end
