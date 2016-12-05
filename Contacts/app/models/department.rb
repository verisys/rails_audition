class Department < ActiveRecord::Base
  
  has_many :contacts, :dependent => :nullify
  
  def self.options_for_select
    order('LOWER(name)').map { |d| [d.name, d.id] }
  end
  
end
