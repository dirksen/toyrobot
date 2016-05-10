require 'robot'
require 'table'

describe Robot do
  let(:table) { Table.new() }
  context '#initialize' do
    it 'is in an invalid (not placed) location to start' do
      expect(Robot.new(table).location.valid).to eq false
    end
  end
end