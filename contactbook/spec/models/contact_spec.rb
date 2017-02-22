require "rails_helper"

RSpec.describe Contact, :type => :model do
  before(:each) do
    FactoryGirl.create(:contact)
  end
  it "returns unique departments" do
    expect(Contact.departments).to eq(['IT'])
  end
end
