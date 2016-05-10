require 'parse'

describe Parse do
  it 'returns nil for no input' do
    expect(Parse.parse('')).to eq [nil, nil]
  end
  it 'returns nil for nonsense input' do
    expect(Parse.parse('twas brillig and the slithy toves')).to eq [nil, nil]
  end
end