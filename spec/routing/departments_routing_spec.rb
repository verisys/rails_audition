require 'rails_helper'

RSpec.describe DepartmentsController, type: :routing do
  describe 'routing' do

    it 'routes to #contacts' do
      expect(:get => 'departments/1/contacts').to route_to('departments#contacts', :id => '1')
    end

  end
end
