class Department < ApplicationRecord
  belongs_to :supervisor
  has_many :contacts
end