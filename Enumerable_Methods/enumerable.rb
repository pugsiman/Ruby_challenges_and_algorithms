module Enumerable
	def my_each
		for i in (0...self.length)
			yield(self[i])
		end
		self
	end
	
	def my_each_with_index
		for i in (0...self.length)
			yield(self[i], i)
		end
		self
	end
	
	def my_select
		selected=[]
		self.my_each {|i| selected << i if yield(i)}
		selected
	end
	
	def my_all?
		istrue = true
		self.my_each {|i| istrue = false unless yield(i)}
		istrue
	end
	
	def my_any?
		istrue = false
		self.my_each {|i| istrue = true if yield(i)}
		istrue
	end
	
	def my_none?
		istrue = true
		self.my_each {|i| istrue = false unless yield(i)}
		istrue
	end
	
	def  my_count
		self.my_select {|i| yield(i)}.length
	end
	
	def my_map(a)
		new_array = []
		self.my_each {|i| new_array << a.call(i)}
		new_array
	end
	
	def my_inject(memo=nil)
		array = memo.nil? ? self[1...size] : self
		memo ||= self[0]
		array.my_each {|i, a| memo = yield(memo, i)}
		memo
	end
	
	def multiply_els
		self.my_inject {|a,b| a*b}
	end
end

p [1,2,3].my_each {|num| print " num: " + num.to_s + " |"}

puts "-----------------------------------------------------------------------------------"

p [1,3,5].my_each_with_index{|num, idx| print " num: " + num.to_s, " index: " + idx.to_s + " |"}

puts "-----------------------------------------------------------------------------------"

p [1,2,3,4,5].my_select {|num| num > 3}

puts "-----------------------------------------------------------------------------------"

p ["a", "bc", "def"].my_any? {|i| i.length > 2}

puts "-----------------------------------------------------------------------------------"

p ["a", "bc", "def"].my_all? {|i| i.length < 2}

puts "-----------------------------------------------------------------------------------"

p ["a", "bc", "def"].my_none? {|i| i.length > 2}

puts "-----------------------------------------------------------------------------------"

p ["a", "bc", "def"].my_count {|i| i.length < 3}

puts "-----------------------------------------------------------------------------------"

p [1,2,3,4].multiply_els {|num| num*num}