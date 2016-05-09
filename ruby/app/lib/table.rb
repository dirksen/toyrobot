class Table
  def initialize(width=5, height=5) do
    @maxX = width - 1
    @maxY = height - 1
  end
  
  def get_width
    @maxX + 1
  end
  
  def get_height
    @maxY + 1
  end
  
  def checkCoords(x, y) do
    x.between?(0, @maxX) && y.between?(0, @maxY)
  end
end