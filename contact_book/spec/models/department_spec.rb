require 'rails_helper'

RSpec.describe Department, type: :model do
  describe "attributes" do
  	it { should have_many :contacts }
  	it { should belong_to :user }
  end

  describe "validations" do
  	it { should validate_presence_of :name}
  	it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe "hooks" do
  	it "should titleize dept names" do
  		dept = Department.create(name: "name")
  		expect(Department.last.name).to eq(dept.name.titleize)
  	end
  end
end
 