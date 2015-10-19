module Enumerable
  def my_each
    0.upto(length - 1) do |i|
      yield(self[i])
    end
    self
  end

  def my_each_with_index
    0.upto(length - 1) do |i|
      yield(self[i], i)
    end
    self
  end

  def my_select
    selected = []
    my_each { |i| selected << i if yield(i) }
    selected
  end

  def my_all?
    all = true
    my_each { |i| all = false unless yield(i) }
    all
  end

  def my_any?
    any = false
    my_each { |i| any = true if yield(i) }
    any
  end

  def my_none?
    none = true
    my_each { |i| none = false unless yield(i) }
    none
  end

  def my_count
    my_select { |i| yield(i) }.length
  end

  def my_map(a)
    new_array = []
    my_each { |i| new_array << a.call(i) }
    new_array
  end

  def my_inject(memo = nil)
    array = memo.nil? ? self[1...size] : self
    memo ||= self[0]
    array.my_each { |i, _a| memo = yield(memo, i) }
    memo
  end

  def multiply_els
    my_inject { |a, b| a * b }
  end
end

p [1, 2, 3].my_each { |num| print "num: #{num} |" }

puts '-------------------------------------------------------------------------'

p [1, 3, 5].my_each_with_index { |num, idx| print "num: #{num}, index:#{idx}|" }

puts '-------------------------------------------------------------------------'

p [1, 2, 3, 4, 5].my_select { |num| num > 3 }

puts '-------------------------------------------------------------------------'

p %w(a bc def).my_any? { |i| i.length > 2 }

puts '-------------------------------------------------------------------------'

p %w(a bc def).my_all? { |i| i.length < 2 }

puts '-------------------------------------------------------------------------'

p %w(a bc def).my_none? { |i| i.length > 2 }

puts '-------------------------------------------------------------------------'

p %w(a bc def).my_count { |i| i.length < 3 }

puts '-------------------------------------------------------------------------'

p [1, 2, 3, 4].multiply_els { |num| num * num }
