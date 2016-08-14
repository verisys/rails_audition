require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
  before(:each) do
    assign(:contacts, [
      Contact.create!(
        :department_id => 1,
        :name => "Name",
        :business_phone => "Business Phone",
        :home_phone => "Home Phone",
        :emergency_contact_name => "Emergency Contact Name",
        :emergency_contact_phone => "Emergency Contact Phone"
      ),
      Contact.create!(
        :department_id => 1,
        :name => "Name",
        :business_phone => "Business Phone",
        :home_phone => "Home Phone",
        :emergency_contact_name => "Emergency Contact Name",
        :emergency_contact_phone => "Emergency Contact Phone"
      )
    ])
  end

  it "renders a list of contacts" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Business Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Home Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Emergency Contact Name".to_s, :count => 2
    assert_select "tr>td", :text => "Emergency Contact Phone".to_s, :count => 2
  end
end
