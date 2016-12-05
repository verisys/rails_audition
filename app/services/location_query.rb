class LocationQuery
  def initialize()
  end
  
  def all
    Location.all
  end
  
  def paginate(page)
    Location.paginate(page)
  end
    
end