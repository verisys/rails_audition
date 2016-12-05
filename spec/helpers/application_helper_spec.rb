require 'factory_girl'
require 'spec_helper'

describe ApplicationHelper do
  before(:each) do
    @user_1 = FactoryGirl.create(:user)
    @user_2 = FactoryGirl.create(:user)
    @department = FactoryGirl.build(:department, supervisor: @user_1)
  end

  describe '#user_is_department_supervisor' do
    it 'returns true if current user is department supervisor' do
      assign(:current_user, @user_1)
      expect(helper.user_is_department_supervisor(@department.supervisor_id)).to be_truthy
    end

    it 'returns false if current user is not department supervisor' do
      assign(:current_user, @user_2)
      expect(helper.user_is_department_supervisor(@department.supervisor_id)).to be_falsey
    end
  end
end