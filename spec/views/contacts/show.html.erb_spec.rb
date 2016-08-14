require 'rails_helper'

RSpec.describe 'contacts/show', type: :view do
  before(:each) do
    @contact = assign(:contact, FactoryGirl.create(:contact))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(@contact.department.name)
    expect(rendered).to match(@contact.name)
    expect(rendered).to match(@contact.business_phone)
    expect(rendered).to match(@contact.home_phone)
    expect(rendered).to match(@contact.emergency_contact_name)
    expect(rendered).to match(@contact.emergency_contact_phone)
  end
end
