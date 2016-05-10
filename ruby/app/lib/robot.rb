require 'parse'

class Robot
  def initialize(table)
    @table = table
    @location = Location.new(table, -1, -1, :NORTH)
  end
  
  def process(command)
  end
end