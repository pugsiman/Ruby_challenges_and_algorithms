def equil(array)
	array.each_index.select do |i|
		array[0...i].inject(:+) == array[i+1..-1].inject(:+)
	end
end

p equil [-7, 1, 5, 2, -4, 3, 0]