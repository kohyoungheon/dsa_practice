class Node
  attr_accessor :val, :neighbors
  def initialize(val = 0, neighbors = nil)
    @val = val
    neighbors = [] if neighbors.nil?
    @neighbors = neighbors
  end
end

def clone_graph(node)
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
def dfs(matrix, i, j, visited)
  visited[i][j] = true
  dfs(matrix, i+1, j, visited) if i+1 < matrix.size && !visited[i+1][j] && matrix[i+1][j] >= matrix[i][j]

  dfs(matrix, i-1, j, visited) if i-1 >= 0 && !visited[i-1][j] && matrix[i-1][j] >= matrix[i][j]

  dfs(matrix, i, j+1, visited) if j+1 < matrix[0].size && !visited[i][j+1] && matrix[i][j+1] >= matrix[i][j]
  
  dfs(matrix, i, j-1, visited) if j-1 >= 0 && !visited[i][j-1] && matrix[i][j-1] >= matrix[i][j]
end

def pacific_atlantic(matrix)
  return [] if matrix.empty?
  pacific = Array.new(matrix.length) { Array.new(matrix[0].length, false) }
  atlantic = Array.new(matrix.length) { Array.new(matrix[0].length, false) }

  # left side pacific column
  for i in 0...matrix.length
    dfs(matrix, i, 0, pacific)
  end

  # upper side pacific row
  for j in 0...matrix[0].length
    dfs(matrix, 0, j, pacific)
  end

  # right side atlantic column
  for i in 0...matrix.length
    dfs(matrix, i, matrix[0].length - 1, atlantic)
  end

  # down side atlantic row
  for j in 0...matrix[0].length
    dfs(matrix, matrix.length - 1, j, atlantic)
  end
  
  res = []
  for i in 0...matrix.length
    for j in 0...matrix[0].length
      res << [i, j] if pacific[i][j] && atlantic[i][j]
    end
  end
  res
end
#______________________________________________________
def valid_tree(n, edges)
  return true if n.zero?

  adj = Hash.new { |hash, key| hash[key] = [] }
  edges.each do |n1, n2|
    adj[n1] << n2
    adj[n2] << n1
  end

  visit = Set.new

  def dfs(i, prev)
    return false if visit.include?(i)

    visit.add(i)
    adj[i].each do |j|
      next if j == prev
      return false unless dfs(j, i)
    end
    true
  end

  dfs(0, -1) && n == visit.length
end
#_______________________________
def can_finish(num_courses, prereqs)
  graph = build_graph(num_courses, prereqs)

  visiting = Set.new #grey
  visited = Set.new #black

  graph.keys.each do |node|
    return false if has_cycle?(graph, node, visiting, visited)
  end
  return true
end

def has_cycle?(graph, node, visiting, visited)
  return false if visited.include?(node)
  return true if visiting.include?(node)

  visiting << node
  graph[node].each do |neighbor|
    return true if has_cycle?(graph, neighbor, visiting, visited)
  end

  visiting.delete(node)
  visited.add(node)
  false
end

def build_graph(num_courses, prereqs)
  graph = {}

  (0...num_courses).each do |course|
    graph[course] = []
  end

  prereqs.each do |prereq|
    a, b = prereq
    graph[a] << b
  end

  graph
end