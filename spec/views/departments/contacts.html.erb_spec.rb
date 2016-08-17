require 'factory_girl'
require 'rails_helper'

RSpec.describe 'departments/contacts', type: :view do
  before(:each) do
    @department = FactoryGirl.create(:department)
    @contact_1 = FactoryGirl.create(:contact, { department: @department })
    @contact_2 = FactoryGirl.create(:contact, { department: @department })

    assign(:contacts, [ @contact_1, @contact_2 ])
    assign(:department, @department)
  end

  context 'current user IS department supervisor' do
    before(:each) do
      allow(view).to receive(:user_is_department_supervisor).and_return(true)
    end

    it 'renders a list of contacts' do
      render
      assert_select 'tbody>tr', count: 2
    end

    it 'displays link to add contact' do
      render
      expect(rendered).to match(/New Contact/)
    end
  end

  context 'current user is NOT department supervisor' do
    before(:each) do
      allow(view).to receive(:user_is_department_supervisor).and_return(false)
    end

    it 'hides link to add contact' do
      render
      expect(rendered).to_not match(/New Contact/)
    end
  end
end
