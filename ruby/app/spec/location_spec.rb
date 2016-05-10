require 'location'
require 'table'

describe Location do
  let(:table) { Table.new() }
  context '#initialize' do
    it 'should give a valid location for coords within the table' do
      l = Location.new(table, 3, 4, :NORTH)
      expect(l.valid).to eq true
      expect(l.x).to eq 3
      expect(l.y).to eq 4
      expect(l.facing).to eq :NORTH
    end
    
    it 'should give an invalid location for coords outside the table' do
      l = Location.new(table, -1, 10, :NORTH)
      expect(l.valid).to eq false
    end
  end
  context '#move' do
    let(:loc) {  }
    it 'should move north within the table' do
      l = Location.new(table, 2, 2, :NORTH)
      ll = l.move
      expect(ll.x).to eq 2
      expect(ll.y).to eq 3
      expect(ll.facing).to eq :NORTH
    end
    it 'should move west within the table' do
      l = Location.new(table, 2, 2, :WEST)
      ll = l.move
      expect(ll.x).to eq 1
      expect(ll.y).to eq 2
      expect(ll.facing).to eq :WEST
    end
    it 'should move south within the table' do
      l = Location.new(table, 2, 2, :SOUTH)
      ll = l.move
      expect(ll.x).to eq 2
      expect(ll.y).to eq 1
      expect(ll.facing).to eq :SOUTH
    end
    it 'should move east within the table' do
      l = Location.new(table, 2, 2, :EAST)
      ll = l.move
      expect(ll.x).to eq 3
      expect(ll.y).to eq 2
      expect(ll.facing).to eq :EAST
    end
  end
end