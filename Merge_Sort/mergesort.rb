def merge_sort(array)
  return array if array.length == 1
  mid_mark = array.length / 2 - 1
  left = merge_sort(array[0..mid_mark])
  right = merge_sort(array[mid_mark + 1..-1])
  merge(left, right)
end

def merge(left, right)
  return right if left.empty?
  return left if right.empty?
  if left.first < right.first
    [left.first] + merge(left[1..-1], right)
  else
    [right.first] + merge(left, right[1..-1])
  end
end

print merge_sort [7,4,2,5,9,5,1]