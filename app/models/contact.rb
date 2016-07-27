class Contact < ApplicationRecord
  has_many :employees, class_name: "Contact",
                       foreign_key: "manager_id",
                       inverse_of: :manager

  belongs_to :manager, class_name: "Contact", optional: true

  belongs_to :department, optional: true

  scope :sales, -> {where(department_id: Department.sales).all}
  scope :billing, -> {where(department_id: Department.billing).all}
  scope :support, -> {where(department_id: Department.support).all}

  scope :active, -> { where(active: true) }

  def self.filter(filter)
    if filter
      where(department_id: filter).all
    end
  end

end
