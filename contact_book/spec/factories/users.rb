FactoryGirl.define do
  factory :user do
    sequence :email do |n|
			"email#{n}@email.com"
		end
		name "test user"
		password "password"
		password_confirmation "password"
  end
end
