RSpec.shared_context 'login_manager' do
  let(:manager) { FactoryGirl.create(:manager) }

  before do
    visit login_path
    click_link('Log in')
    fill_in 'Email', with: manager.email
    fill_in 'Password', with: manager.password
    click_button 'Log in'
  end

  describe 'Salesman logs in' do
    it 'should be a valid user' do
      expect(manager).to be_valid
    end

    it 'accepts owner login' do
      expect(page).to have_content("Welcome #{manager.name.capitalize}")
    end
  end
end