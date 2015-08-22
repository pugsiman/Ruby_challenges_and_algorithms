def equil(array)
	indices = []
	for a in (0..(array.length-1))
		if array[0..a] = array[a..(array.length-1)]
			indices << a
			p a
		end
	end
	indices
end

equil [-7, 1, 5, 2, -4, 3, 0]