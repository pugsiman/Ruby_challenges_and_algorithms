def equil(array)
	left, right = 0, a.inject(0, :+)
	indices = []
 
	array.each_with_index do |val, i|
		right -= val
		indices << i if right == left
		left += val
	end
	indices << -1 if indices.empty?
	
	indices.join(", ").to_i
end

p equil [-7, 1, 5, 2, -4, 3, 0]
p equil [-1, 0, 1]