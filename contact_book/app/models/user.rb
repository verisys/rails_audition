class User < ApplicationRecord
	has_one :department

	validates_presence_of :name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_validation do |user|
  	user.name = user.name.titleize
  end
end
