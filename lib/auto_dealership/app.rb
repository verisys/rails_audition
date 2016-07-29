module AutoDealership
  class App

    attr_reader :name
    attr_reader :version
    attr_reader :author
    
    NAME = "Auto Dealership Audition"
    VERSION = "1.0.0"
    AUTHOR = "Curtis Spendlove"

    def initialize
      @name = NAME
      @version = VERSION
      @author = AUTHOR
    end

  end
end