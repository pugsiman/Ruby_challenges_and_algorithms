require '../caesar.rb'

describe '#caesar_cipher' do
  it 'returns a forward shifted string' do
    expect(caesar_cipher('abc', 2)).to eq 'cde'
  end

  it 'returns a backward shifted string' do
    expect(caesar_cipher('abc', -2)).to eq 'yza'
  end

  it 'preserves capital letters' do
    expect(caesar_cipher('Abc aBc', 1)).to eq 'Bcd bCd'
  end

  it 'preserves panctuation marks' do
    expect(caesar_cipher('a,bc?!', 1)).to eq 'b,cd?!'
  end

  it 'wraps from z to a' do
    expect(caesar_cipher('xyz', 3)).to eq 'abc'
  end

  it 'wraps from a to z' do
    expect(caesar_cipher('abc', -3)).to eq 'xyz'
  end

  it 'handles no shift at all' do
    expect(caesar_cipher('abc', 0)).to eq 'abc'
  end
end
