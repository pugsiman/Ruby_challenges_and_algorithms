def solution(a)
    lowest_value, biggest_value = 0, a.inject(0, :+)
    lowest_spread, spreads = 0, []
    a.each do |value|
        biggest_value -= value
        lowest_value += value
        spreads << (biggest_value - lowest_value).abs
        lowest_spread = spreads.min
    end
    lowest_spread
end