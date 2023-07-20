class Node
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end
#____________________________________
# n = number of nodes,Time: O(n), Space: O(n)
def depth_first_values(root)
  return [ ] if root.nil?

  values = [ ]
  stack = [ root ]

  while stack.length > 0
    current = stack.pop
    values << current.val

    stack << current.right if current.right
    stack << current.left if current.left
  end
  values
end
# n = number of nodes,Time: O(n), Space: O(n)
def depth_first_values_rec(root)
  return [] if root.nil?

  values = []
  values << root.val
  values += depth_first_values_rec(root.left) if root.left
  values += depth_first_values_rec(root.right) if root.right
  return values
end

#_____________________________________________
# n = number of nodes, Time: O(n), Space: O(n)
def breadth_first_values(root)
  return [ ] if root.nil?

  values = [ ]
  queue = [root]

  while queue.length > 0
    current = queue.shift
    values << current.val

    queue << current.left if current.left
    queue << current.right if current.right
  end

  values
end

#_____________________________________
# n = number of nodes, Time: O(n), Space: O(n)
def tree_sum(root)
  return 0 if root.nil?

  total = 0
  queue = [ root ]

  while queue.length > 0
    current = queue.shift
    total += current.val

    queue << current.left if current.left
    queue << current.right if current.right
  end
  total
end
# n = number of nodes, Time: O(n), Space: O(n)
def tree_sum_rec(root)
  return 0 if root.nil?

  return root.val + tree_sum_rec(root.left) + tree_sum_rec(root.right)
end
#_______________________________________
# n = number of nodes, Time: O(n), Space: O(n)

def tree_includes(root, target)
  return false if root.nil?

  queue = [ root ]
  while queue.length > 0
    current = queue.shift
    return true if current.val == target
    queue << current.left if current.left
    queue << current.right if current.right
  end
  false
end

# n = number of nodes, Time: O(n), Space: O(n)
def tree_includes_rec(root,target)
  return false if root.nil?
  return true if root.val == target
  
  #This works because boolean gets returned
  return tree_includes_rec(root.left, target) || tree_includes_rec(root.right, target)
end

#___________________________________________________
# n = number of nodes, Time: O(n), Space: O(n)
def tree_min_value(root)
  smallest = Float::INFINITY

  stack = [root]

  while stack.length > 0
    current = stack.pop

    smallest = current.val if current.val < smallest

    stack << current.right if current.right
    stack << current.left if current.left
  end
  smallest
end
# n = number of nodes, Time: O(n), Space: O(n)
def tree_min_value_rec(root)
  return 1/0.0 if root.nil?
  min_left = tree_min_value_rec(root.left)
  min_right = tree_min_value_rec(root.right)
  return [min_left, min_right, root.val].min
end
#______________________________________________
# n = number of nodes, Time: O(n), Space: O(n)
def max_path_sum(root)
return -1/0.0 if root.nil?

return root.val if root.left.nil? && root.right.nil?
max_left = max_path_sum(root.left)
max_right = max_path_sum(root.right)
return [max_left, max_right].max + root.val
end
#_____________________________________________


