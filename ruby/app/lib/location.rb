Facings = %i{NORTH WEST SOUTH EAST}

class Location
  attr_reader :x
  attr_reader :y
  attr_reader :f
  
  def initialize(table, x, y, f)
    @valid = false
    if Facings.include?(f)
      if table.checkCoords(x, y)
        @x = x
        @y = y
        @f = f
        @valid = true
      end
    end
  end
  
  def valid
    return @valid
  end
end