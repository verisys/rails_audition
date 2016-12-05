# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string           not null
#  type                   :string						not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#

require 'rails_helper'

RSpec.describe User, type: :model do
	describe "validations" do
		it { should validate_presence_of :name }
		it { should validate_presence_of :type }
	end

  describe 'self.types' do
		it 'returns array of valid subclasses' do
			expect(User.types).to eq(["Owner", "Inventory Manager", "Salesman"])
		end
	end 
end
