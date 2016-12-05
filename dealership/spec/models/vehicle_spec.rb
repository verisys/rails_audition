require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe 'should belong to location' do
    it{ should belong_to :location }
  end
end
