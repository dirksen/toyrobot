require 'robot'
require 'table'
require 'location'

describe Robot do
  let(:table) { Table.new() }
  context '#initialize' do
    it 'is in an invalid (not placed) location to start' do
      expect(Robot.new(table).location.valid).to eq false
    end
    it 'can be initialized with a valid location' do
      l = Location.new(table, '2', '3', 'NORTH')
      expect(Robot.new(table, location: l).location).to eq l
    end
  end
  context '#place' do
    let(:robot) { Robot.new(table) }
    it 'returns current location if the command is invalid' do
      expect(robot.place(['5'])).to eq robot.location
    end
    it 'returns the current location if the location would be invalid' do
      expect(robot.place(['-1', '2', 'NORTH'])).to eq robot.location
    end
    it 'returns a new location if it is valid' do
      location = robot.place(['2', '3', 'SOUTH'])
      expect(location.x).to eq 2
      expect(location.y).to eq 3
      expect(location.facing).to eq :SOUTH
    end
  end
  context '#process' do
    let(:robot) { Robot.new(table) }
    it 'responds with an error for an unrecognised command' do
      expect(robot).to receive(:error)
      robot.process("twas brillig and the slithy toves")
    end
  end
end