def solution(a)
    lowest_value, biggest_value = 0, a.inject(0, :+)
    lowest_spread, spreads = 0, []
    a.each do |value|
		spreads << (biggest_value - lowest_value).abs
		biggest_value -= value
		lowest_value += value
    end
	lowest_spread = spreads.min
end