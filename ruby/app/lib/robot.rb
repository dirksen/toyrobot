require_relative 'parse'
require_relative 'location'

class Robot
  attr_reader :location
  def initialize(table, location: nil)
    @table = table
    @location = location || Location.new(table, '-1', '-1', 'NORTH')
  end
  
  def place(args)
    if args.count != 3 then return @location end
    newLocation = Location.new(@table, args[0], args[1], args[2])
    return newLocation.valid ? newLocation : @location
  end
  
  def report
    # Not actually discarding REPORT before PLACE, because it's useful
    puts @location
    return self
  end
  
  def error(command)
    puts "Unrecognised command `#{command}`"
    return self
  end
  
  def process(command)
    cmd, args = Parse.parse(command)
    case cmd
    when :PLACE then return Robot.new(@table, location: place(args))
    when :MOVE then return Robot.new(@table, location: @location.move)
    when :LEFT then return Robot.new(@table, location: @location.left)
    when :RIGHT then return Robot.new(@table, location: @location.right)
    when :REPORT then return report
    else return error(command)
    end
  end
end