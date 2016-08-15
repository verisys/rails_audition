require 'factory_girl'
require 'rails_helper'
require 'support/validation_examples'

describe Department, :type => :model do
  subject { described_class.new }

  include_examples 'required attributes example', [:name]

  it 'validates uniqueness of supervisor' do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:department, supervisor: user)
    department_2 = FactoryGirl.build(:department, supervisor: user)
    expect(department_2.valid?).to be_falsey
  end
end