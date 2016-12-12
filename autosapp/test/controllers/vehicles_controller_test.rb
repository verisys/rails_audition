# == Schema Information
#
# Table name: vehicles
#
#  id          :integer          not null, primary key
#  make        :string
#  model       :string
#  price       :float
#  location_id :integer
#  mpg         :string
#  speed       :string
#  status      :string
#  color       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require "test_helper"

describe VehiclesController do
  let(:vehicle) { vehicles :one }

  describe "No user logged in" do
    it "gets index" do
      get vehicles_url
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "gets new" do
      get new_vehicle_url
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "creates vehicle" do
      post vehicles_url, params: {vehicle: {make: vehicle.make, model: vehicle.model,
                                            price: vehicle.price, location_id: 1,
                                            mpg: vehicle.mpg, speed: vehicle.speed,
                                            status: vehicle.status, color: vehicle.color}}
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "shows vehicle" do
      get vehicle_url(vehicle)
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "gets edit" do
      get edit_vehicle_url(vehicle)
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "updates vehicle" do
      patch vehicle_url(vehicle), params: {vehicle: {make: vehicle.make, model: vehicle.model,
                                                     price: vehicle.price, location_id: 1,
                                                     mpg: vehicle.mpg, speed: vehicle.speed,
                                                     status: vehicle.status, color: vehicle.color}}
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "destroys vehicle" do
      delete vehicle_url(vehicle)

      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "can't update location" do
      vehicle = FactoryGirl.create(:vehicle)
      location = FactoryGirl.create(:location)
      post "/update_location", params: {vehicle_id: vehicle.id, id: location.id}
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "can't sell vehicle" do
      vehicle = FactoryGirl.create(:vehicle)
      location = FactoryGirl.create(:location)

      post "/sell_vehicle", params: {vehicle_id: vehicle.id, sales_price: 20000}
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "can't access the sales report" do
      get "/sales"
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

  end

  describe "basic user logged in" do
    def setup
      @user = FactoryGirl.create(:user)
    end

    it "gets index" do
      get vehicles_url(as: @user)
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "gets new" do
      get new_vehicle_url(as: @user)
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "creates vehicle" do
      post vehicles_url(as: @user), params: {vehicle: {make: vehicle.make, model: vehicle.model,
                                                       price: vehicle.price, location_id: 1,
                                                       mpg: vehicle.mpg, speed: vehicle.speed,
                                                       status: vehicle.status, color: vehicle.color}}
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "shows vehicle" do
      get vehicle_url(vehicle, as: @user)
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "gets edit" do
      get edit_vehicle_url(vehicle, as: @user)
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "updates vehicle" do
      patch vehicle_url(vehicle, as: @user), params: {vehicle: {make: vehicle.make, model: vehicle.model,
                                                                price: vehicle.price, location_id: 1,
                                                                mpg: vehicle.mpg, speed: vehicle.speed,
                                                                status: vehicle.status, color: vehicle.color}}
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "destroys vehicle" do
      delete vehicle_url(vehicle, as: @user)

      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "can't update location" do
      vehicle = FactoryGirl.create(:vehicle)
      location = FactoryGirl.create(:location)
      post update_location_url(as: @user), params: {vehicle_id: vehicle.id, id: location.id}
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "can't sell vehicle" do
      vehicle = FactoryGirl.create(:vehicle)
      location = FactoryGirl.create(:location)

      post sell_vehicle_url(as: @user), params: {vehicle_id: vehicle.id, sales_price: 20000}
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "can't access the sales report" do
      get sales_url(as: @user)
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end
  end

  describe "Owner user logged in" do
    def setup
      @user = FactoryGirl.create(:user)
      @user.add_role(:owner)
    end

    it "gets index" do
      get vehicles_url(as: @user)
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "gets new" do
      get new_vehicle_url(as: @user)
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "creates vehicle" do
      post vehicles_url(as: @user), params: {vehicle: {make: vehicle.make, model: vehicle.model,
                                                       price: vehicle.price, location_id: 1,
                                                       mpg: vehicle.mpg, speed: vehicle.speed,
                                                       status: vehicle.status, color: vehicle.color}}
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "shows vehicle" do
      get vehicle_url(vehicle, as: @user)
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "gets edit" do
      get edit_vehicle_url(vehicle, as: @user)
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "updates vehicle" do
      patch vehicle_url(vehicle, as: @user), params: {vehicle: {make: vehicle.make, model: vehicle.model,
                                                                price: vehicle.price, location_id: 1,
                                                                mpg: vehicle.mpg, speed: vehicle.speed,
                                                                status: vehicle.status, color: vehicle.color}}
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "destroys vehicle" do
      delete vehicle_url(vehicle, as: @user)

      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "can't update location" do
      vehicle = FactoryGirl.create(:vehicle)
      location = FactoryGirl.create(:location)
      post update_location_url(as: @user), params: {vehicle_id: vehicle.id, id: location.id}
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "can't sell vehicle" do
      vehicle = FactoryGirl.create(:vehicle)
      location = FactoryGirl.create(:location)

      post sell_vehicle_url(as: @user), params: {vehicle_id: vehicle.id, sales_price: 20000}
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "can't access the sales report" do
      get sales_url(as: @user)
      value(response).must_be :success?
    end
  end

  describe "Inventory user logged in" do
    def setup
      @user = FactoryGirl.create(:user)
      @user.add_role(:inventory)
    end

    it "gets index" do
      get vehicles_url(as: @user)
      value(response).must_be :success?
    end

    it "gets new" do
      get new_vehicle_url(as: @user)
      value(response).must_be :success?
    end

    it "creates vehicle" do
      location = FactoryGirl.create(:location)
      vehicle.location = location

      expect {
        post vehicles_url(as: @user), params: {vehicle: {color: vehicle.color, location_id: vehicle.location_id,
                                              make: vehicle.make, model: vehicle.model, mpg: vehicle.mpg,
                                              price: vehicle.price, speed: vehicle.speed, status: vehicle.status}}
      }.must_change "Vehicle.count"

      must_redirect_to vehicle_path(Vehicle.last)
    end

    it "shows vehicle" do
      get vehicle_url(vehicle, as: @user)
      value(response).must_be :success?
    end

    it "gets edit" do
      get edit_vehicle_url(vehicle, as: @user)
      value(response).must_be :success?
    end

    it "updates vehicle" do
      patch vehicle_url(vehicle, as: @user), params: {vehicle: {color: vehicle.color, location_id: vehicle.location_id,
                                                     make: vehicle.make, model: vehicle.model, mpg: vehicle.mpg,
                                                     price: vehicle.price, speed: vehicle.speed, status: vehicle.status}}
      must_redirect_to vehicle_path(vehicle)
    end

    it "destroys vehicle" do
      expect {
        delete vehicle_url(vehicle, as: @user)
      }.must_change "Vehicle.count", -1

      must_redirect_to vehicles_path
    end

    it "can update location" do
      vehicle = FactoryGirl.create(:vehicle)
      location = FactoryGirl.create(:location)
      post update_location_url(as: @user), params: {vehicle_id: vehicle.id, id: location.id}
      value(response).must_be :success?

      response.parsed_body['retval'].must_equal "Location Updated"
    end

    it "can't sell vehicle" do
      vehicle = FactoryGirl.create(:vehicle)
      location = FactoryGirl.create(:location)

      post sell_vehicle_url(as: @user), params: {vehicle_id: vehicle.id, sales_price: 20000}
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "can't access the sales report" do
      get sales_url(as: @user)
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end
  end

  describe "Sales user logged in" do
    def setup
      @user = FactoryGirl.create(:user)
      @user.add_role(:sales)
    end

    it "gets index" do
      location = FactoryGirl.create(:location)
      vehicle.location_id = location.id
      vehicle.save

      get vehicles_url(as: @user)
      value(response).must_be :success?
    end

    it "gets new" do
      get new_vehicle_url(as: @user)
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."

    end

    it "creates vehicle" do
      post vehicles_url(as: @user), params: {vehicle: {make: vehicle.make, model: vehicle.model,
                                                       price: vehicle.price, location_id: 1,
                                                       mpg: vehicle.mpg, speed: vehicle.speed,
                                                       status: vehicle.status, color: vehicle.color}}
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "shows vehicle" do
      get vehicle_url(vehicle, as: @user)
      value(response).must_be :success?
    end

    it "gets edit" do
      get edit_vehicle_url(vehicle, as: @user)
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "updates vehicle" do
      patch vehicle_url(vehicle, as: @user), params: {vehicle: {make: vehicle.make, model: vehicle.model,
                                                                price: vehicle.price, location_id: 1,
                                                                mpg: vehicle.mpg, speed: vehicle.speed,
                                                                status: vehicle.status, color: vehicle.color}}
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "destroys vehicle" do
      delete vehicle_url(vehicle, as: @user)

      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "can update location" do
      vehicle = FactoryGirl.create(:vehicle)
      location = FactoryGirl.create(:location)
      post update_location_url(as: @user), params: {vehicle_id: vehicle.id, id: location.id}
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "can sell vehicle" do
      vehicle = FactoryGirl.create(:vehicle)
      location = FactoryGirl.create(:location)

      post sell_vehicle_url(as: @user), params: {vehicle_id: vehicle.id, sales_price: 20000}
      value(response).must_be :success?
      response.parsed_body['retval'].must_include "Vehicle sale made for MyString/MyString for"
    end

    it "can access the sales report" do
      get sales_url(as: @user)
      value(response).must_be :success?
    end
  end
end
