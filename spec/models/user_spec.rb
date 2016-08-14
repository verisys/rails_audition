require 'rails_helper'

describe User, :type => :model do
  it 'validates required fields' do
    user = User.create
    expect(user.valid?).to be_falsey
    expect([:first_name,:last_name]).to eq(user.errors.keys)
  end
end