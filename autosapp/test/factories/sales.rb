# == Schema Information
#
# Table name: sales
#
#  id         :integer          not null, primary key
#  vehicle_id :integer
#  user_id    :integer
#  price      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :sale do
    vehicle_id 1
    user_id 1
    price 1.5
  end
end
