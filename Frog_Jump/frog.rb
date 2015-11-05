def solution(x, y, d)
  jumps_num = (y - x) / d.to_f
  jumps_num.ceil
end
