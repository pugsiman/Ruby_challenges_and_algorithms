def factorial(n)
  n == 0 ? 1 : n * factorial(n - 1)
end
1.upto(5) { |i| print "#{i} => ", factorial(i), "\n" }
