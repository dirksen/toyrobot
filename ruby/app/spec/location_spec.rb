require 'location'
require 'table'

describe Location do
  let(:table) { Table.new() }
  context '#initialize' do
    it 'should give a valid location for coords within the table' do
      l = Location.new(table, 3, 4, 'NORTH')
      expect(l.valid).to eq true
      expect(l.x).to eq 3
      expect(l.y).to eq 4
      expect(l.f).to eq 'NORTH'
    end
    
    it 'should give an invalid location for coords outside the table' do
      l = Location.new(table, -1, 10, 'NORTH')
      expect(l.valid).to eq false
    end
  end
end