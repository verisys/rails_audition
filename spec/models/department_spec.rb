require 'rails_helper'

describe Department, :type => :model do
  it 'validates required fields' do
    department = Department.create
    expect(department.valid?).to be_falsey
    expect([:name]).to eq(department.errors.keys)
  end
end