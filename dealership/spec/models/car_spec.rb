# == Schema Information
#
# Table name: cars
#
#  id          :integer          not null, primary key
#  make        :string           not null
#  model       :string           not null
#  price       :integer          not null
#  year        :string
#  mileage     :string
#  sold        :boolean          default(FALSE), not null
#  location_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Car, type: :model do
  describe "attributes" do
  	it { should belong_to :location }
  end

  describe "validations" do
  	it { should validate_presence_of :make }
  	it { should validate_presence_of :model }
  	it { should validate_presence_of :price }
  	it { should validate_presence_of :sold }
  end		
end
