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

class Sale < ApplicationRecord
  belongs_to :location
  belongs_to :vehicle
  belongs_to :user
end
