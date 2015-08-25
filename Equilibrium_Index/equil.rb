def equil(array)
	indices =[]
	array.each_index.select do |i|
		indices << i if array[0...i].inject(:+) == array[i+1..-1].inject(0, :+)
	end
	indices
end

p equil [-7, 1, 5, 2, -4, 3, 0]
p equil [-1, 0, 1]