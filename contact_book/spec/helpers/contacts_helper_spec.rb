require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ContactsHelper. For example:
#
# describe ContactsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ContactsHelper, type: :helper do
  let(:contact) { FactoryGirl.create(:contact) }
  before(:each) do
  	@department = Department.find(contact.department_id)
  	@user = User.find(@department.user_id)
  	sign_in @user
  end

  describe "can edit?" do
  	it "returns true for user's contact" do
  		expect(helper.can_edit?(contact)).to be_truthy
  	end
  end
end
