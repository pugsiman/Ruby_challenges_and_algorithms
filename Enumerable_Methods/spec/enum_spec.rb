require '../enumerable.rb'

describe Enumerable do
  let(:array) { [1, 2, 3, 4, 5] }
  let(:empty_array) { [] }

  describe '#my_each' do
    context 'with block given' do
      it 'will iterate over each element' do
        array.my_each { |v| empty_array << v }
        expect(empty_array).to eq array
      end

      it 'returns an empty array if given nothing' do
        [].my_each { |v| empty_array << v }
        expect(empty_array).to eq []
      end
    end

    context 'without block given' do
      it 'returns an error' do
        expect(-> { array.my_each }).to raise_exception LocalJumpError
      end
    end
  end

  describe '#my_select' do
    context 'with block given' do
      it 'return elements that are true by the block' do
        @array = array.my_select { |i| i < 3 }
        expect(@array).to eq [1, 2]
        expect(empty_array.my_select { |i| i < 3 }).to eq empty_array
        expect(array.my_select { |i| i == 200 }).to eq empty_array
      end
    end

    context 'without block given' do
      it 'returns an error' do
        expect(-> { array.my_select }).to raise_exception LocalJumpError
      end
    end
  end
end
