require 'rails_helper'

shared_examples 'required attributes example' do |attributes|
  it 'validates required fields' do
    expect(subject.valid?).to be_falsey
    expect(attributes).to eq(subject.errors.keys)
  end
end