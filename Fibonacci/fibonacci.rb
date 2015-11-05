def fibs(n)
  arr = [0, 1]
  (n - 1).times { arr << arr[-1] + arr[-2] }
  arr
end

print fibs(5)

def fibs_rec(n)
  return [0] if n == 0
  return [0, 1] if n == 1
  fibs_rec(n - 1) << fibs_rec(n - 1)[-1] + fibs_rec(n - 1)[-2]
end

print "\n", fibs_rec(5)
