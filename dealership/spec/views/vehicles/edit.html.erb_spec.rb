require 'rails_helper'

RSpec.describe "vehicles/edit", type: :view do
  before(:each) do
    location = Location.create(address: 'Test Address')
    @locations = assign(:locations, Location.all)
    @vehicle = assign(:vehicle, Vehicle.create!(
      :make => "MyString",
      :model => "MyString",
      :list_price => 1.5,
      :location => location
    ))
  end

  it "renders the edit vehicle form" do
    render

    assert_select "form[action=?][method=?]", vehicle_path(@vehicle), "post" do

      assert_select "input#vehicle_make[name=?]", "vehicle[make]"

      assert_select "input#vehicle_model[name=?]", "vehicle[model]"

      assert_select "input#vehicle_list_price[name=?]", "vehicle[list_price]"

      # assert_select "input#vehicle_location_id[name=?]", "vehicle[location_id]"
    end
  end
end
