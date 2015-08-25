def solution(a)
  range = (1..a.length+1).select {|i| !a.include?(i)}
  range.join.to_i
end
p solution [1,3,4,5]