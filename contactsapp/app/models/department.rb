class Department < ApplicationRecord
  belongs_to :user
  has_many :contacts

  validates_presence_of :name, :user_id
end
