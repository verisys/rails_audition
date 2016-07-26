FactoryGirl.define do
  factory :salesman do
    sequence :email do |n|
			"salesemail#{n}@email.com"
		end
		name "test user"
		password "password"
		password_confirmation "password"
    type "Salesman"
  end
end