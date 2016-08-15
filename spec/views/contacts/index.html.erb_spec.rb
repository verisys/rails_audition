require 'factory_girl'
require 'rails_helper'

RSpec.describe 'contacts/index', type: :view do
  before(:each) do
    @department = FactoryGirl.create(:department)

    @contact_1 = FactoryGirl.create(:contact, { department: @department })
    @contact_2 = FactoryGirl.create(:contact, { department: @department })
    assign(:contacts, [ @contact_1, @contact_2 ])
  end

  it 'renders a list of contacts' do
    render
    assert_select 'tbody>tr', count: 2
  end

  it 'adds \'deactivated\' class to inactive contacts' do
    @contact_1.active = false
    render
    assert_select '.deactivated', count: 1
  end
end
