require '../enumerable.rb'

# I'm actually raising exceptions here when blocks are not passed.
# This is not a native behavior, but I didn't want to rewrite, and still works.

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
        expect(array.my_select { |i| i < 3 }).to eq [1, 2]
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

  describe '#my_all?' do
    context 'with block given' do
      it 'returns true if all elements are returned true by the block' do
        expect(array.my_all? { |i| i.is_a? Fixnum }).to eq true
        expect(array.my_all? { |i| i > 0 }).to eq true
      end

      it 'returns false if not all elements are returned true by the block' do
        expect(array.my_all? { |i| i.is_a? String }).to eq false
        expect(array.my_all? { |i| i == 2 }).to eq false
      end
    end

    context 'without block given' do
      it 'returns an error' do
        expect(-> { array.my_all? }).to raise_exception LocalJumpError
      end
    end
  end

  describe '#my_any?' do
    context 'with block given' do
      it 'returns true if one of the elements is returned as true' do
        expect(array.my_any? { |i| i == 2 }).to eq true
      end

      it 'returns false if none of the elements is returned as true' do
        expect(array.my_any? { |i| i.is_a? String }).to eq false
        expect(array.my_any? { |i| i == 10 }).to eq false
      end
    end

    context 'withhout block given' do
      it 'returns and error' do
        expect(-> { array.my_any? }).to raise_exception LocalJumpError
      end
    end
  end

  describe '#my_none?' do
    context 'with block given' do
      it 'returns true if none of the elements are returned as true' do
        expect(array.my_none? { |i| i == 10 }).to eq true
        expect(array.my_none? { |i| i.is_a? String }).to eq true
      end

      it 'returns false if any of the elements is returned as true' do
        expect(array.my_none? { |i| i == 2 }).to eq false
      end
    end

    context 'without block given' do
      it 'returns and error' do
        expect(-> { array.my_none? }).to raise_exception LocalJumpError
      end
    end
  end

  describe '#my_count' do
    context 'with block given' do
      it 'returns amount of elements that returned as true' do
        expect(array.my_count(&:even?)).to eq 2
        expect(array.my_count(&:odd?)).to eq 3
      end
    end

    context 'with argument given' do
      it 'returns amount of elements equal to argument' do
        expect(array.my_count(1)).to eq 1
        expect(array.my_count(-5)).to eq 0
        expect(empty_array.my_count(1)).to eq 0
      end
    end

    context 'without argument nor block' do
      it 'returns the length of the array' do
        expect(array.my_count).to eq 5
      end
    end
  end

  describe '#my_map' do
    context 'with block given' do
      it 'invokes block for each element' do
        expect(array.my_map { |i| i * 2 }).to eq [2, 4, 6, 8, 10]
        expect(array.my_map(&:odd?)).to eq [true, false, true, false, true]
      end
    end

    context 'without block given' do
      it 'returns an error' do
        expect(-> { array.my_map }).to raise_exception LocalJumpError
      end
    end
  end

  describe '#my_inject' do
    context 'with only block given' do
      it 'combines elements by preset operation' do
        expect(array.my_inject { |i, a| i + a }).to eq 15
      end
    end

    context 'with block given and memo value (argument)' do
      it 'combines elements and memo (per element) by instruction' do
        expect(array.my_inject(2) { |i, a| i + a }).to eq 17
        expect(array.my_inject(0) { |i, a| i + a }).to eq 15
        expect(array.my_inject(2) { |i, a| i * a }).to eq 240
      end
    end

    context 'with neither block nor argument' do
      it 'returns an error' do
        expect(-> { array.my_inject }).to raise_exception LocalJumpError
      end
    end
  end

  describe '#multiply_els' do
    it 'multiplies elements of array' do
      expect(array.multiply_els).to eq 120
    end
  end
end
