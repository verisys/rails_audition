RSpec.shared_context 'login_salesman' do
  let(:salesman) { FactoryGirl.create(:salesman) }

  before do
    visit login_path
    click_link('Log in')
    fill_in 'Email', with: salesman.email
    fill_in 'Password', with: salesman.password
    click_button 'Log in'
  end

  describe 'Salesman logs in' do
    it 'should be a valid user' do
      expect(salesman).to be_valid
    end

    it 'accepts owner login' do
      expect(page).to have_content("Welcome #{salesman.name.capitalize}")
    end
  end
end