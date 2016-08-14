require 'rails_helper'

RSpec.describe "contacts/show", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :department_id => 1,
      :name => "Name",
      :business_phone => "Business Phone",
      :home_phone => "Home Phone",
      :emergency_contact_name => "Emergency Contact Name",
      :emergency_contact_phone => "Emergency Contact Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Business Phone/)
    expect(rendered).to match(/Home Phone/)
    expect(rendered).to match(/Emergency Contact Name/)
    expect(rendered).to match(/Emergency Contact Phone/)
  end
end
