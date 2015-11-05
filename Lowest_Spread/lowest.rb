def solution(a)
  lowest_value = 0
  biggest_value = a.inject(0, :+)
  spreads = []
  a.each do |value|
    spreads << (biggest_value - lowest_value).abs
    biggest_value -= value
    lowest_value += value
  end
  spreads.min
end
