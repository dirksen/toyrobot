require 'parse'

class Robot
  attr_reader :location
  def initialize(table)
    @table = table
    @location = Location.new(table, -1, -1, :NORTH)
  end
  
  def place(cmd, args)
    newLocation = Location.new(@table, args[0], args[1], args[2])
    if newLocation.valid then return newLocation else return @location end
  end
  
  def report
    puts "Reporting for duty"
    return self
  end
  
  def process(command)
    cmd, args = Parse.parse(command)
    case cmd
    when :PLACE then return Robot.new(@table, place(cmd, args))
    when :MOVE then return Robot.new(@table, @location.move)
    when :LEFT then return Robot.new(@table, @location.left)
    when :RIGHT then return Robot.new(@table, @location.right)
    when :REPORT then return report
    end
  end
end