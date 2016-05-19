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

def fibs_rec_memo(n, memo=nil)
  memo = {} if memo.nil?
  key = n
  
  unless memo.key? key
    if n == 0
      memo[key] = [0] 
    end
    
    elsif n == 1
      memo[key] = [0, 1] 
    end
    
    else
      answer = fibs_rec_memo(n - 1) << fibs_rec_memo(n - 1)[-1] + fibs_rec_memo(n - 1)[-2]
      memo[key] = answer
    end
  end
  
  return memo[key]
end

print "\n", fibs_rec_memo(5)
