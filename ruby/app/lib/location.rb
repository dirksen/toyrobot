Facings = %i{NORTH WEST SOUTH EAST}

class Location
  attr_reader :x
  attr_reader :y
  attr_reader :facing
  attr_reader :table
  
  def initialize(table, x, y, facing)
    @table = table
    @valid = false
    if Facings.include?(facing)
      if table.checkCoords(x, y)
        @x = x
        @y = y
        @facing = facing
        @valid = true
      end
    end
  end
  
  def valid
    return @valid
  end

  def move
    case @facing
    when :NORTH
      return Location.new(@table, @x, @y+1, @facing)
    when :WEST
      return Location.new(@table, @x-1, @y, @facing)
    when :SOUTH
      return Location.new(@table, @x, @y-1, @facing)
    when :EAST
      return Location.new(@table, @x+1, @y, @facing)
    end
  end
end