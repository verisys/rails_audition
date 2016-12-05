# == Schema Information
#
# Table name: locations
#
#  id             :integer          not null, primary key
#  address_line_1 :string           not null
#  address_line_2 :string
#  city           :string           not null
#  state          :string           not null
#  zip_code       :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryGirl.define do
  factory :location do
    address_line_1 "MyString"
    address_line_2 "MyString"
    city "MyString"
    state "MyString"
    zip_code "MyString"
  end
end
