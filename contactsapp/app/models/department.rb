# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Department < ApplicationRecord
  belongs_to :user
  has_many :contacts

  validates_presence_of :user  
  validates_presence_of :name
end
