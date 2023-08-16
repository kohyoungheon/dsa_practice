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
  root.righ = tmp

  invert_tree(root.left)
  invert_tree(root.right)
end