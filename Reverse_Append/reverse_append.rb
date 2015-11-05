def reverse_append(n, ary = [])
  return ary if n < 0
  reverse_append(ary, n - 1)
  ary << n
end

-1.upto(2) { |i| print "#{i} => ", reverse_append(i), "\n" }
