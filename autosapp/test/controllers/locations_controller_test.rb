# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string
#  street     :string
#  city       :string
#  state      :string
#  zip        :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"


class LocationsControllerTest < ActionDispatch::IntegrationTest
  let(:dlr_location) { locations :one }

  describe "No user logged in" do
    it "gets index" do
      get locations_url
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "gets new" do
      get new_location_url
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "creates location" do
      post locations_url, params: {location: {city: dlr_location.city, name: dlr_location.name,
                                              phone: dlr_location.phone, state: dlr_location.state,
                                              street: dlr_location.street, zip: dlr_location.zip}}
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "shows location" do
      get location_url(dlr_location)
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "gets edit" do
      get edit_location_url(dlr_location)
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "updates location" do
      patch location_url(dlr_location), params: {location: {city: dlr_location.city, name: dlr_location.name,
                                                            phone: dlr_location.phone, state: dlr_location.state,
                                                            street: dlr_location.street, zip: dlr_location.zip}}
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "destroys location" do
      delete location_url(dlr_location)

      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end
  end

  describe "user logged in without owner role" do
    def setup
      @user = FactoryGirl.create(:user)
    end

    it "gets index" do
      get locations_url(as: @user)
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "gets new" do
      get new_location_url(as: @user)
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "creates location" do
      post locations_url(as: @user), params: {location: {city: dlr_location.city, name: dlr_location.name,
                                                         phone: dlr_location.phone, state: dlr_location.state,
                                                         street: dlr_location.street, zip: dlr_location.zip}}
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "shows location" do
      get location_url(dlr_location, as: @user)
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "gets edit" do
      get edit_location_url(dlr_location, as: @user)
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "updates location" do
      patch location_url(dlr_location, as: @user), params: {location: {city: dlr_location.city, name: dlr_location.name,
                                                                       phone: dlr_location.phone, state: dlr_location.state,
                                                                       street: dlr_location.street, zip: dlr_location.zip}}
      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end

    it "destroys location" do
      delete location_url(dlr_location, as: @user)

      value(response).must_be :redirect?
      assert_redirected_to "/"
      flash[:alert].must_equal "You are not authorized to perform this action."
    end
  end

  describe "user logged in as owner" do
    def setup
      @user = FactoryGirl.create(:user)
      @user.add_role :owner
    end

    it "gets index" do
      get locations_url(as: @user)
      value(response).must_be :success?
    end

    it "gets new" do
      get new_location_url(as: @user)
      value(response).must_be :success?
    end

    it "creates location" do
      expect {
        post locations_url(as: @user), params: {location: {city: dlr_location.city,
                                                           name: dlr_location.name,
                                                           phone: dlr_location.phone,
                                                           state: dlr_location.state,
                                                           street: dlr_location.street,
                                                           zip: dlr_location.zip}}
      }.must_change "Location.count"

      must_redirect_to location_path(Location.last)
    end

    it "shows location" do
      get location_url(dlr_location, as: @user)
      value(response).must_be :success?
    end

    it "gets edit" do
      get edit_location_url(dlr_location, as: @user)
      value(response).must_be :success?
    end

    it "updates location" do
      patch location_url(dlr_location, as: @user), params: {location: {city: dlr_location.city,
                                                                       name: dlr_location.name,
                                                                       phone: dlr_location.phone,
                                                                       state: dlr_location.state,
                                                                       street: dlr_location.street,
                                                                       zip: dlr_location.zip}}
      must_redirect_to location_path(dlr_location)
    end

    it "destroys location" do
      expect {
        delete location_url(dlr_location, as: @user)
      }.must_change "Location.count", -1

      must_redirect_to locations_path
    end
  end

  describe "deleting location - referential integrity test" do
    def setup
      @user = FactoryGirl.create(:user)
      @user.add_role :owner
    end

    it 'must not allow deletion if location has vehicles' do
      dlr_location.vehicles << FactoryGirl.create(:vehicle)
      expect {
        delete location_url(dlr_location, as: @user)
      }.must_change "Location.count", 0

      must_redirect_to locations_path
      flash[:alert].must_equal "Location not destroyed.  Still has vehicles!"
    end
  end
end

