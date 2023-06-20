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
