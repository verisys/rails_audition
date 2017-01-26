require 'spec_helper'

RSpec.describe Location, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:cars) }
    it { is_expected.to have_many(:employees) }
  end
end
