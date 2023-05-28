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

def breadth_first_values(root)
  
end