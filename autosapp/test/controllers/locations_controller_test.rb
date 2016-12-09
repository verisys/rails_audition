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

describe LocationsController do
  let(:dlr_location) { locations :one }

  it "gets index" do
    get locations_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_location_url
    value(response).must_be :success?
  end

  it "creates location" do
    expect {
      post locations_url, params: { location: { city: dlr_location.city, name: dlr_location.name,
                                                phone: dlr_location.phone, state: dlr_location.state,
                                                street: dlr_location.street, zip: dlr_location.zip } }
    }.must_change "Location.count"

    must_redirect_to location_path(Location.last)
  end

  it "shows location" do
    get location_url(dlr_location)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_location_url(dlr_location)
    value(response).must_be :success?
  end

  it "updates location" do
    patch location_url(dlr_location), params: { location: { city: dlr_location.city, name: dlr_location.name,
                                                            phone: dlr_location.phone, state: dlr_location.state,
                                                            street: dlr_location.street, zip: dlr_location.zip } }
    must_redirect_to location_path(dlr_location)
  end

  it "destroys location" do
    expect {
      delete location_url(dlr_location)
    }.must_change "Location.count", -1

    must_redirect_to locations_path
  end
end
