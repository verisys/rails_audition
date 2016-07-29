require 'rails_helper'

RSpec.describe "vehicles/show", type: :view do
  before(:each) do
    location = Location.create(address: 'Test Address')
    @vehicle = assign(:vehicle, Vehicle.create!(
      :make => "Make",
      :model => "Model",
      :list_price => 2.5,
      :location => location
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Make/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(//)
  end
end
