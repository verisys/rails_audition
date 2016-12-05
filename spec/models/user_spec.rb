require 'rails_helper'
require 'support/validation_examples'

describe User, :type => :model do
  subject { described_class.new }

  include_examples 'required attributes example', [:first_name, :last_name]
end