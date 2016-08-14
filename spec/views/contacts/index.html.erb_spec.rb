require 'factory_girl'
require 'rails_helper'

RSpec.describe 'contacts/index', type: :view do
  before(:each) do
    @department = FactoryGirl.create(:department)

    assign(:contacts, [
      FactoryGirl.create(:contact, { department: @department }),
      FactoryGirl.create(:contact, { department: @department }),
      FactoryGirl.create(:contact, { department: @department })
    ])
  end

  it 'renders a list of contacts' do
    render
    assert_select 'tbody>tr', count: 3
  end
end
