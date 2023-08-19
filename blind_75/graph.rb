class Node
  attr_accessor :val, :neighbors
  def initialize(val = 0, neighbors = nil)
    @val = val
    neighbors = [] if neighbors.nil?
    @neighbors = neighbors
  end
end

def cloneGraph(node)
  dfs(node, {})
end

def dfs(node, clones)
  return if node.nil?
  return clones[node] if clones.key?(node)
  
  clone = Node.new(node.val)
  clones[node] = clone
  
  node.neighbors.each do |n|
      clone.neighbors << dfs(n, clones)
  end
  
  clone
end
#___________________________________________
