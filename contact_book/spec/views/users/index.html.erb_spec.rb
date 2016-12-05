require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    department = Department.create(name: 'Test Department')
    assign(:users, [
      User.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :department_id => department.id
      ),
      User.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :department_id => department.id
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
  end
end
