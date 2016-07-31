RSpec.shared_context 'login_owner' do
  let(:owner) { FactoryGirl.create(:owner) }

  before do
    @shared_var = 'Awesome Shared Var'
    visit login_path
    click_link('Log in')
    fill_in 'Email', with: owner.email
    fill_in 'Password', with: owner.password
    click_button 'Log in'
  end

  describe 'Owner logs in' do
    it 'should be a valid user' do
      expect(owner).to be_valid
    end

    it 'accepts owner login' do
      expect(page).to have_content("Welcome #{owner.name.capitalize}")
    end
  end
end