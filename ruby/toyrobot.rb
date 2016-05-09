require './lib/table'
require './lib/robot'
require './lib/commandline'

# Create a table
table = Table.new()
# Create a robot
robot = Robot.new()
# Create an input processor
input = CommandLine.new()

while true do
  robot = robot.process(input.get_command)