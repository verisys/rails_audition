require 'rails_helper'

RSpec.describe 'contacts/new', type: :view do
  before(:each) do
    assign(:contact, FactoryGirl.build(:contact))
  end

  it 'renders new contact form' do
    render

    assert_select 'form[action=?][method=?]', contacts_path, 'post' do

      # assert_select 'input#contact_department_id[name=?]', 'contact[department_id]'

      assert_select 'input#contact_name[name=?]', 'contact[name]'

      assert_select 'input#contact_business_phone[name=?]', 'contact[business_phone]'

      assert_select 'input#contact_home_phone[name=?]', 'contact[home_phone]'

      assert_select 'input#contact_emergency_contact_name[name=?]', 'contact[emergency_contact_name]'

      assert_select 'input#contact_emergency_contact_phone[name=?]', 'contact[emergency_contact_phone]'
    end
  end
end
