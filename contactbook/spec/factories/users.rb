require 'faker'

FactoryGirl.define do
  factory :user do
    department "IT"
    email { Faker::Internet.email }
    password "password"
  end
end
