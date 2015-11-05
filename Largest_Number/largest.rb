# with "magic" (quicksort)

def largest_num(num)
  splited = num.to_s.split('')
  splited.sort { |a, b| b <=> a }.join.to_i
end

p largest_num 257

# without magic

def largest_without_magic(num)
  splited = num.to_s.split('')
  loop do
    sorted = true
    for a in (0...(splited.length - 1))
      if splited[a] < splited[a + 1]
        sorted = false
        splited[a], splited[a + 1] = splited[a + 1], splited[a]
      end
    end
    break if sorted
  end
  splited.join.to_i
end

p largest_without_magic 20_574
