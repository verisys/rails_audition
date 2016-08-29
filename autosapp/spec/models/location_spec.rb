require 'rails_helper'

RSpec.describe Location, type: :model do
  context "is valid with a name" do
    it "is valid with a name" do
      location = Location.create(name: "My Happy Location")

      expect(location).to be_valid
    end

    it "is invalid without a name" do
      location = Location.create(name: nil)

      location.should have(1).errors_on(:name)
    end
  end
end
