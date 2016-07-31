FactoryGirl.define do
  factory :vehicle do
    make "Ford"
    model "Mundeo"
    list_price 100
    location
  end

  factory :vehicle1, class: Vehicle do
    make "Ford"
    model "Mustang"
    list_price 2000
    location
  end

  factory :vehicle2, class: Vehicle do
    make "Ford"
    model "Focus"
    list_price 1000
    location
  end

  factory :vehicle3, class: Vehicle do
    make "Ford"
    model "Edge"
    list_price 1500
    location
  end

  factory :vehicle4, class: Vehicle do
    make "Honda"
    model "Civic"
    list_price 1500
    location
  end

  factory :vehicle5, class: Vehicle do
    make "Lexus"
    model "SC430"
    list_price 10000
    location
  end
end
