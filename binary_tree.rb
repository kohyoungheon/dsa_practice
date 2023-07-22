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
# n = number of nodes,Time: O(n^2), Space: O(n)
def path_finder(root, target)
  return nil if root.nil?

  return [root.val] if root.val == target

  left_path = path_finder(root.left, target)
  return [root.val] + left_path if left_path

  right_path = path_finder(root.right, target)
  return [root.val] + right_path if right_path

  return nil
end

#________________________________________________

def tree_value_count(root, target)
  return 0 if root.nil?

  stack = [root]
  count = 0

  while stack.length > 0
    current = stack.pop
    count += 1 if current.val == target

    stack << current.left if current.left
    stack << current.right if current.right
  end

  return count
end

def tree_value_count_rec(root, target)
  return 0 if root.nil?

  match = root.val == target ? 1 : 0 

  return match + tree_value_count(root.left, target) + tree_value_count(root.right, target)
end

#_______________________________________________
# n = number of nodes, Time: O(n), Space: O(n)
def how_high(node)
  return -1 if node.nil?

  left_tree_height = how_high(node.left)
  right_tree_height = how_high(node.right)

  return [left_tree_height, right_tree_height].max + 1
end

#_________________________________________________
# n = number of nodes, Time: O(n), Space: O(n)
def bottom_right_value(root)
  return nil if root.nil?

  queue = [root]

  while queue.length > 0
    current = queue.shift

    queue << current.left if current.left
    queue << current.right if current.right
  end

  current.val
end

#____________________________________________
# n = number of nodes, Time: O(n), Space: O(n)
def all_tree_paths(root)
  return [] if root.nil?

  return [ [root.val] ] if root.left.nil? && root.right.nil?
  
  paths = []

  left_paths = all_tree_paths(root.left)
  left_paths.each do |path|
    paths << [root.val] + path
  end

  right_paths = all_tree_paths(root.right)
  right_paths.each do |path|
    paths << [root.val] + path
  end

  paths
end

#___________________________________________________
# n = number of nodes, Time: O(n), Space: O(n)
def tree_levels(root)
  return [] if root.nil?

  levels = []

  stack =[ [root, 0] ]

  while stack.length > 0
    node, level_num = stack.pop

    if levels.length == level_num
      levels << [node.val]
    else
      levels[level_num] << node.val
    end
    stack << [node.right, level_num + 1] if node.right
    stack << [node.left, level_num + 1] if node.left
  end

  return levels
end

#________________________________________________-
def level_averages(root)
  levels = []
  fill_level_averages(root, levels, 0)
  avgs = []
  levels.each do |level|
    avgs << level.sum/level.length.to_f
  end
  avgs
end

def fill_level_averages(root, levels, level_num)
  return if root.nil?

  if levels.length == level_num
    levels << [root.val]
  else
    levels[level_num] << root.val
  end

  fill_level_averages(root.left, levels, level_num + 1)
  fill_level_averages(root.right, levels, level_num + 1)

end

#___________________________________

def leaf_list(root)
  stack = [root]
  leaves = []

  while stack.length > 0
    current = stack.pop

    leaves << current.val if current.right.nil? && current.left.nil?

    stack << current.right if current.right
    stack << current.left if current.left
  end

  leaves
end

def leaf_list_rec(root)
  leaves = []
  fill_leaves(root, leaves)
  leaves
end

def fill_leaves(root, leaves)
  return if root.nil?

  leaves << root.val if root.left.nil? && root.right.nil?

  fill_leaves(root.left, leaves)
  fill_leaves(root.right, leaves)
end

#_________________________________________________