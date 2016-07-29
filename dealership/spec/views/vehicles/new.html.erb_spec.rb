require 'rails_helper'

RSpec.describe "vehicles/new", type: :view do
  before(:each) do
    location = Location.create(address: 'Test Address')
    assign(:locations, Location.all)
    assign(:vehicle, Vehicle.new(
      :make => "MyString",
      :model => "MyString",
      :list_price => 1.5,
      :location => location
    ))
  end

  it "renders new vehicle form" do
    render

    assert_select "form[action=?][method=?]", vehicles_path, "post" do

      assert_select "input#vehicle_make[name=?]", "vehicle[make]"

      assert_select "input#vehicle_model[name=?]", "vehicle[model]"

      assert_select "input#vehicle_list_price[name=?]", "vehicle[list_price]"

      assert_select "input#vehicle_location_id[name=?]", "vehicle[location_id]"
    end
  end
end
