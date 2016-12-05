require 'rails_helper'

RSpec.describe "vehicles/index", type: :view do
  before(:each) do
    location = Location.create(address: 'Test Address')
    assign(:locations, Location.all)
    User.create!(
        :name => "Name",
        :email => "Email1@email.com",
        position: 'salesman',
        password: 'password',
        password_confirmation:'password'
    )
    assign(:vehicles, [
      Vehicle.create!(
        :make => "Make",
        :model => "Model",
        :list_price => 2.5,
        :location => location
      ),
      Vehicle.create!(
        :make => "Make",
        :model => "Model",
        :list_price => 2.5,
        :location => location
      )
    ])

    user = User.last
    allow(view).to receive(:current_user).and_return(user)
  end

  it "renders a list of vehicles" do
    render
    assert_select "tr>td", :text => "Make".to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
