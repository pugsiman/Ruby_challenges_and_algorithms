def equil(array)
  left = 0
  right = array.inject(0, :+)
  indices = []

  array.each_with_index do |val, i|
    right -= val
    indices << i if right == left
    left += val
  end
  indices << '-1 (none)' if indices.empty?

  indices.join(', ')
end

puts equil [-7, 1, 5, 2, -4, 3, 0]
puts equil [-1, 0, 1]
