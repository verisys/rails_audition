FactoryGirl.define do
  factory :department do
    sequence :name do |n|
    	"name#{n}"
    end
    user
  end
end
