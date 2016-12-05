FactoryGirl.define do
  factory :user do
    name "User"
    email "myemail@email.com"
    position "Salesman"
    password "password"
    password_confirmation "password"
  end

  factory :owner, class: User do
    name "Ownername"
    email "owner@email.com"
    position "Salesman"
    password "password"
    password_confirmation "password"
    owner true
  end

  factory :manager, class: User do
    name "Managername"
    email "manager@email.com"
    position "Inventory Manager"
    password "password"
    password_confirmation "password"
  end

  factory :salesman, class: User do
    name "Salesmanname"
    email "salesman@email.com"
    position "Salesman"
    password "password"
    password_confirmation "password"
  end
end
