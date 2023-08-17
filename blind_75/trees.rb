class Node
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end
#__________________________________________________
# Time: O(n), and the space complexity is O(n) in the worst case and O(log n) in the best case.
def invert_tree(root)
  return nil if root.nil?

  tmp = root.left
  root.left = root.right
  root.right = tmp

  invert_tree(root.left)
  invert_tree(root.right)
end
#__________________________________________________

def max_depth_bfs(root)
  return 0 if root.nil?

  level = 0
  queue = [root]
  while queue.length > 0
    queue.length.times do |i|
      current = queue.shift
      queue << current.left if current.left
      queue << current.right if current.right
    end
    level += 1
  end

  return level
end

def max_depth_dfs(root)
  stack = [[root, 1]]
  res = 0

  until stack.empty?
    node, depth = stack.pop

    if node
      res = [res, depth].max
      stack.push([node.left, depth + 1])
      stack.push([node.right, depth + 1])
    end
  end
  res
end

#__________________________________________________

def is_same_tree(p, q)
  return true if p.nil? && q.nil?
  return false if p.nil? || q.nil?
  return false if p.val != q.val

  is_same_tree(p.left, q.left) && is_same_tree(p.right, q.right)
end
#__________________________________________________

def is_subtree(s, t)
  return true if t.nil?
  return false if s.nil?

  return true if is_same_tree(s, t)
  is_subtree(s.left, t) || is_subtree(s.right, t)
end

#___________________________________________________

def lowest_common_ancestor(root, p, q)
  current = root
  while current
    if p.val > current.val && q.val > current.val
      current = current.right
    elsif p.val < current.val && q.val < current.val
      current = current.left
    else
      return current
    end
  end
end
#___________________________________________________
#BFS
def level_order(root)
  return [] if root.nil?
  result = []
  level = [root]

  until level.empty?
      vals = []
      next_level = []
      
      level.each do |node|
          vals << node.val
          next_level << node.left  if node.left
          next_level << node.right if node.right
      end
      
      result << vals
      level = next_level
  end
  
  result
end

# def level_order(root)
#   return [] if root.nil?
#   levels = []
#   fill_levels(root, levels, 0)
#   levels
# end

#DFS
def fill_levels(root, levels, level_num)
  return if root.nil?

  if levels.length == level_num
    levels << [root.val]
  else
    levels[level_num] << root.val
  end
  fill_levels(root.left, levels, level_num + 1)
  fill_levels(root.right, levels, level_num + 1)
end

def level_order_dfs(root)
  return [] if root.nil?
  levels = []
  stack = [[root,0]]

  while !stack.empty?
    current, level = stack.pop

    if levels.length == level
      levels << [current.val]
    else
      levels[level] << current.val
    end

    stack << [current.right, level + 1] if current.right
    stack << [current.left, level + 1] if current.left
  end
  levels
end
#_________________________________________________-

def is_valid_bst(root)
  valid(root, -Float::INFINITY, Float::INFINITY)
end

def valid(node, left, right)
  return true if node.nil?
  return false unless (left < node.val && node.val < right)

  valid(node.left, left, node.val) && valid(node.right, node.val, right)
end
#__________________________________________________

def kth_smallest(root, k)
  stack = []
  current = root

  while !stack.empty? || !current.nil?
    while current
      stack << current
      current = current.left
    end

    current = stack.pop
    k -= 1
    return current.val if k == 0
    current = current.right
  end
end
#_________________________________________________-

def build_tree(preorder, inorder)
  return nil if preorder.empty? || inorder.empty?

  root = Node.new(preorder[0])
  mid = inorder.index(preorder[0])
  root.left = build_tree(preorder[1..mid], inorder[0...mid])
  root.right = build_tree(preorder[mid + 1..-1], inorder[mid + 1..-1])
  root
end