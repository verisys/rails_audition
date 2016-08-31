require 'rails_helper'

RSpec.describe Location, type: :model do
  it "is valid with a name" do
    location = Location.create(name: "My Happy Location")

    expect(location).to be_valid
  end

  it "is invalid without a name" do
    Location.create(name: nil)

    expect(Location.count).to eq(0)
  end
end
