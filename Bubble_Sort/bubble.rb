def bubble_sort(array)
	loop do
		bubble_sorted = true
		# using for-loop to avoid iterate over non-existent value, causing error.
		for a in (0...(array.length-1))
			if array[a] > array[a+1]
				bubble_sorted = false
				array[a], array[a+1] = array[a+1], array[a]
			end
		end
	break if bubble_sorted
	end
	array
end

print bubble_sort([4,3,78,2,0,2])

def bubble_sort_by(array)
	loop do
		bubble_sorted=true
		for a in (0..(array.length-2) )
			if (yield(array[a],array[a+1])) && (yield(array[a],array[a+1])) > 0
				bubble_sorted = false
				array[a], array[a+1] = array[a+1], array[a]
			end
		end
		break if bubble_sorted
	end
	return array
end

print bubble_sort_by(["hi","hello","hey"]) {|left,right| left.length - right.length}