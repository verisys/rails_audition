class Contact < ActiveRecord::Base
  
  filterrific :default_filter_params => { :sorted_by => 'created_at_desc' },
              :available_filters => %w[
                sorted_by
                search_query
                with_department_id
                with_active
              ]

  # default for will_paginate
  self.per_page = 10

  belongs_to :department

  scope :search_query, lambda { |query|
    return nil  if query.blank?
    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)
    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conditions = 2
    where(
      terms.map {
        or_clauses = [
          "LOWER(contacts.first_name) LIKE ?",
          "LOWER(contacts.last_name) LIKE ?"
        ].join(' OR ')
        "(#{ or_clauses })"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }

  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      order("contacts.created_at #{ direction }")
    when /^name_/
      order("LOWER(contacts.last_name) #{ direction }, LOWER(contacts.first_name) #{ direction }")
    when /^department_name_/
      order("LOWER(departments.name) #{ direction }").includes(:department)
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }
  scope :with_department_id, lambda { |department_ids|
    where(:department_id => [*department_ids])
  }
  scope :with_active, lambda { |active|
    where(:active => (active == 'true'))
  }

  delegate :name, :to => :department, :prefix => true

  def self.options_for_sorted_by
    [
      ['Name (a-z)', 'name_asc'],
      ['Department (a-z)', 'department_name_asc']
    ]
  end

  def full_name
    [last_name, first_name].compact.join(', ')
  end

  def decorated_created_at
    created_at.to_date.to_s(:long)
  end
  
end
