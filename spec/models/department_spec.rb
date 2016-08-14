require 'rails_helper'
require 'support/validation_examples'

describe Department, :type => :model do
  subject { described_class.new }

  include_examples 'required attributes example', [:name]
end