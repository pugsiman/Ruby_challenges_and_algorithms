# each instance represents a node in the tree
class Node
  attr_reader :value
  attr_accessor :left, :right

  def initialize(value)
    @value = value
  end

  def add_node(new_node)
    if new_node < @value
      left.nil? ? self.left = Node.new(new_node) : left.add_node(new_node)
    else
      right.nil? ? self.right = Node.new(new_node) : right.add_node(new_node)
    end
  end
end

def build_tree(array)
  array.shuffle!
  root_node = Node.new(array.shift)
  array.each { |val| root_node.add_node(val) }
  root_node
end

def bfs(target, current_node)
  queue = [current_node]
  puts "Searching for #{target} (bfs)..."
  until queue.empty?
    current = queue.first.value
    return "#{target} was found in the tree (object #{queue.first}).\n" if current == target
    queue << queue.first.left unless queue.first.left.nil?
    queue << queue.first.right unless queue.first.right.nil?
    queue.shift
  end
  puts "#{target} was not found in the tree."
end

def dfs(target, current_node)
  stack = [current_node]
  checked = [current_node]
  puts "Searching for #{target} (dfs)..."
  until stack.empty?
    current = stack.last.value
    return "#{target} was found in the tree (object #{stack.last})\n" if current == target
    if stack.last.left && !checked.include?(stack.last.left)
      stack << stack.last.left
      checked << stack.last
    elsif stack.last.right && !checked.include?(stack.last.right)
      stack << stack.last.right
      checked << stack.last
    else
      stack.pop
    end
  end
  puts "#{target} was not found in the tree."
end

def dfs_rec(target, current_node)
  return "#{target} was found in the tree (object #{current_node})\n" if current_node.value == target
  left_branch_search = dfs_rec(target, current_node.left) unless current_node.left.nil?
  return left_branch_search unless left_branch_search.nil?
  right_branch_search = dfs_rec(target, current_node.right) unless current_node.right.nil?
  return right_branch_search unless right_branch_search.nil?
end

binary_tree = build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
print bfs(9, binary_tree)
print bfs(44, binary_tree)
print dfs(9, binary_tree)
print dfs(44, binary_tree)
puts 'Searching for 9 (dfs recursive)...'
print dfs_rec(9, binary_tree)
