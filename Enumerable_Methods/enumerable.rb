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
    my_each { |i| yield(i) ? none = false : none }
    none
  end

  def my_count(arg = nil)
    if block_given?
      my_select { |i| yield(i) }.length
    else
      count = 0
      my_each { |i| count += 1 if arg == i }
      my_each { count += 1 if arg.nil? }
      count
    end
  end

  def my_map
    new_array = []
    my_each { |i| new_array << yield(i) }
    new_array
  end

  def my_inject(memo = nil)
    array = memo.nil? ? self[1...size] : self
    memo ||= self[0]
    array.my_each { |i| memo = yield(memo, i) }
    memo
  end

  def multiply_els
    my_inject { |a, b| a * b }
  end
end
