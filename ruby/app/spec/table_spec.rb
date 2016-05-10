require 'table'

describe Table do
  context 'when created with defaults' do
    let(:table) { Table.new() }
    it 'has a width of 5' do
      expect(table.width).to eq 5
    end
    it 'has a height of 5' do
      expect(table.height).to eq 5
    end
    context '#checkCoords' do
      it 'returns false for negative X' do
        expect(table.checkCoords(-1, 3)).to eq false
      end
      it 'returns false for negative Y' do
        expect(table.checkCoords(2, -5)).to eq false
      end
      it 'returns true for a valid location' do
        expect(table.checkCoords(2, 3)).to eq true
      end
      it 'returns false for > max X' do
        expect(table.checkCoords(8, 3)).to eq false
      end
      it 'returns false for > max Y' do
        expect(table.checkCoords(2, 7)).to eq false
      end
      it 'returns true for upper bounds' do
        expect(table.checkCoords(4, 4)).to eq true
      end
      it 'returns false for one out of upper bounds' do
        expect(table.checkCoords(5, 5)).to eq false
      end
    end
    context '#place' do
      it 'returns an invalid location outside the bounds' do
        expect(table.place(8, 10, :NORTH).valid).to eq false
      end
      it 'returns a valid location inside the bounds' do
        expect(table.place(3, 4, :NORTH).valid).to eq true
      end
    end
  end
end