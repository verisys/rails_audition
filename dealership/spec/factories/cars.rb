# == Schema Information
#
# Table name: cars
#
#  id          :integer          not null, primary key
#  make        :string           not null
#  model       :string           not null
#  price       :integer          not null
#  year        :string
#  mileage     :string
#  sold        :boolean          default(FALSE), not null
#  location_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :car do
    make "MyString"
    model "MyString"
    price 1
    location
    year "MyString"
    mileage "MyString"
    sold true
  end
end
