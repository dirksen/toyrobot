require 'parse'

describe Parse do
  it 'returns nil for no input' do
    expect(Parse.parse('')).to eq [nil, nil]
  end
  it 'returns nil for nonsense input' do
    expect(Parse.parse('twas brillig and the slithy toves')).to eq [nil, nil]
  end
  it 'returns upcased command for known command' do
    expect(Parse.parse('move')).to eq ['MOVE', nil]
  end
  it 'recognises PLACE and returns with args' do
    expect(Parse.parse('PLACE x,y,z')).to eq ['PLACE', 'x,y,z']
  end
  it 'recognises LEFT' do
    expect(Parse.parse('LEFT')).to eq ['LEFT', nil]
  end
  it 'recognises RIGHT' do
    expect(Parse.parse('RIGHT')).to eq ['RIGHT', nil]
  end
  it 'recognises MOVE' do
    expect(Parse.parse('MOVE')).to eq ['MOVE', nil]
  end
  it 'recognises REPORT' do
    expect(Parse.parse('REPORT')).to eq ['REPORT', nil]
  end
end