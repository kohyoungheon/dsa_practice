require 'deque'

class Node
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

#n = number of nodes, Time: O(n), Space: O(n)
def depth_first_values(root)
  return [] if root.nil?

  values = []
  stack = [root]
  while stack.length > 0
    current = stack.pop
    values << current.val

    stack << current.right if current.right
    stack << current.left if current.left
  end
  return values
end

#Recursive
#n = number of nodes, Time: O(n), Space: O(n)
def depth_first_values_rec(root)
  return [] if root.nil?

  values = []
  values << root.val
  values += depth_first_values_rec(root.left) if root.left
  values += depth_first_values_rec(root.right) if root.right
  return values
end
#_______________________________________________________________________________
# n = number of nodes, Time: O(n), Space: O(n)
def breadth_first_values(root)
  return [] if root.nil?

  values = []
  queue = Deque.new
  queue.push(root)
  # queue = [ root ]
  
  while queue.length > 0
    current = queue.shift
    # current = queue.shift   This shift makes it (N^2)
    values << current.val

    queue << current.left if current.left
    queue << current.right if current.right
  end
  return values
end
#_______________________________________________________________________________
#Iterative
# n = number of nodes, Time: O(n), Space: O(n)
def tree_sum(root)
  return 0 if root.nil?
  total = 0
  queue = [root]

  while queue.length > 0
    current = queue.shift
    total += current.val

    queue << current.left if current.left
    queue << current.right if current.right
  end
  total
end

#Recursive
#n = number of nodes, Time: O(n), Space: O(n)
def tree_sum_rec(root)
  return 0 if root.nil?

  return root.val + tree_sum(root.left) + tree_sum(root.right)
end

#_______________________________________________________________________________
#Iterative breadth first search
# n = number of nodes, Time: O(n), Space: O(n)
def tree_includes(root, target)
  return false if root.nil?

  queue = [root]

  while queue.length > 0
    current = queue.shift
    return true if current.val == target

    queue << current.left if current.left
    queue << current.right if current.right
  end

  return false
end
#RECURSIVE depth first search
#n = number of nodes,Time: O(n),Space: O(n)
def tree_includes_rec(root, target)
  return false if root.nil?

  return true if root.val == target

  return tree_includes_rec(root.left, target) || tree_includes_rec(root.right, target)
end

#_______________________________________________________________________________

# Depth first (iterative) n = number of nodes, Time: O(n), Space: O(n)
def tree_min_value(root)
  smallest = Float::INFINITY
  stack = [root]
  while stack.length > 0
    current = stack.pop
    
    smallest = current.val if current.val < smallest
    stack << current.left if current.left
    stack << current.right if current.right
  end
  return smallest
end

#Depth first (recursive), n = number of nodes, Time: O(n), Space: O(n)
def tree_min_value_rec(root)
  return Float::INFINITY if root.nil?

  min_left = tree_min_value_rec(root.left)
  min_right = tree_min_value_rec(root.right)

  return [left, right, root.val].min
end
#_______________________________________________________________________________

# Depth first (recursive), n = number of nodes, Time: O(n), Space: O(n)
def max_path_sum(root)
  return -Float::INFINITY if root.nil?

  return root.val if root.left.nil? && root.right.nil?

  max_left = max_path_sum(root.left)
  max_right = max_path_sum(root.right)
  return [max_left, max_right].max + root.val
end
#_______________________________________________________________________________
# Depth first (recursive), n = number of nodes, Time: O(n), Space: O(n)
def path_finder(root, target)
  return nil if root.nil?

  return [root.val] if root.val == target

  left_path = path_finder(root.left, target)
  return [root.val] + left_path if left_path

  right_path = path_finder(root.right, target)
  return [root.val] + right_path if right_path

  return nil
end
#_______________________________________________________________________________
#Recursive depth first search, n = number of nodes, Time: O(n), Space: O(n)
def tree_value_count_rec(root,target)
  return 0 if root.nil?

  match = root.val == target ? 1 : 0 
  return match + tree_value_count(root.left, target) + tree_value_count(root.right, target)
end

def tree_value_count(root,target)
  return 0 if root.nil?

  count = 0
  stack = [root]
  while stack.length > 0
    current = stack.pop
    count += 1 if current.val == target

    stack << current.left if current.left
    stack << current.right if current.right
  end
  return count
end
#_______________________________________________________________________________
#Recursive, n = number of nodes, Time: O(n), Space: O(n)
def how_high(node)
  return -1 if node.nil?

  left_tree_height = how_high(node.left)
  right_tree_height = how_high(node.right)

  return [left_tree_height, right_tree_height].max + 1
end
#_______________________________________________________________________________

def bottom_right_value(root)
  return nil if root.nil?

  queue = [root]
  
  while queue.length > 0
    current = queue.shift

    queue << current.left if current.left
    queue << current.right if current.right
  end
  
  return current.val
end

def all_tree_paths(root)
  
end