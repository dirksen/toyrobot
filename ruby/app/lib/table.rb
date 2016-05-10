class Table
  def initialize(width=5, height=5)
    @maxX = width - 1
    @maxY = height - 1
  end
  
  def width
    @maxX + 1
  end
  
  def height
    @maxY + 1
  end
  
  def checkCoords(x, y)
    x.between?(0, @maxX) && y.between?(0, @maxY)
  end
  
  def place(x, y, f)
    return Location.new(self, x, y, f)
  end
end