require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'expects name and email' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(50) }

    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_most(255) }

    it { should have_secure_password }
    it { should validate_length_of(:password).is_at_least(6) }

    it { should have_many :sales }
  end
end
