require 'spec_helper'

RSpec.describe Car, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:location) }
  end
end
