require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    department = Department.create(name: 'Test Department')
    @phone_numbers = assign(:phone_numbers, {"Home"=>"234532", "Business"=>"3454 x54667"})
    @user = assign(:user, User.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :department_id => department.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
  end
end
