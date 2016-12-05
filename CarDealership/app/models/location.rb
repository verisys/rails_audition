class Location < ActiveRecord::Base
  
  has_many :contacts, :dependent => :nullify
  
end
