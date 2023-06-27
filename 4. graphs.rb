#n = number of nodes, O(n) time, O(n) space
def depth_first_print(graph, start)
  stack = [ start ]
  while stack.length > 0
    current = stack[-1]
    puts current
    stack.pop
    graph[current].each do |neighbor|
      stack.push(neighbor)
    end
  end
end

#n = number of nodes, O(n) time, O(n) space
def depth_first_print_rec(graph, current)
  puts current
  graph[current].each do |neighbor|
    depth_first_print_rec(graph, neighbor)
  end
end

#n = number of nodes, O(n) time, O(n) space
def breadth_first_print(graph, start)
  queue = [ start ]
  while queue.length > 0
    current = queue[0]
    puts current
    queue.shift
    graph[current].each do |neighbor|
      queue.push(neighbor)
    end
  end
end
#_______________________________________________________________________________
#Depth first recursive
#n = number of nodes, e = number edges, Time: O(e), Space: O(n)
def has_path(graph, src, dst)
  return true if src == dst
  graph[src].each do |neighbor|
    if has_path(graph, neighbor, dst) == true
      return true
    end
  end

  return false
end

#Breadth first
#n = number of nodes, e = number edges, Time: O(e), Space: O(n)
def has_path_breadth(graph, src, dst)
  queue = [ src ]

  while queue.length > 0
    current = queue.shift

    return true if current == dst

    graph[current].each do |neighbor|
      queue.push(neighbor)
    end
  end
  return false
end
#_______________________________________________________________________________
#Helper method
def build_graph(edges)
  graph = {}

  edges.each do |edge|
    a, b = edge
    graph[a] = [] if graph[a].nil?
    graph[b] = [] if graph[b].nil?
    
    graph[a].push(b)
    graph[b].push(a)
  end

  return graph
end

#Helper Method
def has_path_2(graph, src, dst, visited)

  return true if src == dst
  return false if visited.include?(src)

  visited.add(src)

  graph[src].each do |neighbor|
    if has_path_2(graph, neighbor, dst, visited) == true
      return true
    end
  end
  return false
end

#Depth first recursive
#n = number of nodes, e = number edges, Time: O(e), Space: O(n)
def undirected_path(edges, node_A, node_B)
  graph = build_graph(edges)
  return has_path_2(graph, node_A, node_B, Set.new)
end

#_______________________________________________________________________________
#Helper method
def explore(graph, current, visited)
  return false if visited.include?(current)

  visited.add(current)
  graph[current].each do |neighbor|
    explore(graph, neighbor, visited)
  end

  return true
end
#Depth first recursive
#n = number of nodes, e = number edges, Time: O(e), Space: O(n)
def connected_components_count(graph)
  visited = Set.new
  count = 0

  graph.each do |node, _|
    if explore(graph, node, visited) == true
      count += 1
    end
  end

  return count
end
#_______________________________________________________________________________
def explore_size(graph, node, visited)

  return 0 if visited.include?(node)
  visited.add(node)

  size = 1
  graph[node].each do |neighbor|
    size += explore_size(graph, neighbor, visited)
  end

  return size
end
#Depth first recursive
#n = number of nodes, e = number edges, Time: O(e), Space: O(n)
def largest_component(graph)
  visited = Set.new
  largest = 0
  graph.each do |node, _|
    size = explore_size(graph, node, visited)
    largest = size if size > largest
  end
  return largest
end
#_______________________________________________________________________________
#Breadth first
#e = number edges, Time: O(e), Space: O(e)
def shortest_path(edges, node_A, node_B)
  graph = build_graph(edges)
  visited = Set.new([node_A])
  queue = [ [node_A, 0] ]

  while queue.length > 0
    node, distance = queue.shift

    return distance if node == node_B

    graph[node].each do |neighbor|
      if visited.include?(neighbor) == false
        visited.add(neighbor)
        queue.push([neighbor, distance + 1])
      end
    end
  end
  return -1
end
#_______________________________________________________________________________
#Helper Method
def explore_island(grid, r, c, visited)

  row_inbounds = (0 <= r && r < grid.length)
  col_inbounds = (0 <= c && c < grid[0].length)
  return false if !row_inbounds || !col_inbounds

  return false if grid[r][c] == "W"

  pos = [r, c]
  return false if visited.include?(pos)
  visited.add(pos)
  
  explore_island(grid, r - 1, c, visited)
  explore_island(grid, r + 1, c, visited)
  explore_island(grid, r, c - 1, visited)
  explore_island(grid, r, c + 1, visited)

  return true
end

def island_count(grid)

  visited = Set.new
  count = 0


  grid.length.times do |r|
    grid[0].length.times do |c|
      if explore_island(grid, r, c, visited) == true
        count += 1
      end
    end
  end

  return count
end
#_______________________________________________________________________________
#depth first recursive
#n = number of nodes, e = number edges, Time: O(e), Space: O(n)
def minimum_island(grid)
  visited = Set.new
  min_size = Float::INFINITY

  grid.length.times do |r|
    grid[0].length.times do |c|
      size = explore_size_2(grid, r, c, visited)
      min_size = size if size > 0 && size < min_size
    end
  end
  return min_size
end

def explore_size_2(grid, r, c, visited)
  row_inbounds = (0 <= r && r < grid.length)
  col_inbounds = (0 <= c && c < grid[0].length)
  return 0 if !row_inbounds || !col_inbounds

  return 0 if grid[r][c] == "W"

  pos = [r, c]
  return 0 if visited.include?(pos)
  visited.add(pos)

  size = 1
  size += explore_size_2(grid, r - 1, c, visited)
  size += explore_size_2(grid, r + 1, c, visited)
  size += explore_size_2(grid, r, c - 1, visited)
  size += explore_size_2(grid, r, c + 1, visited)
  return size
end
#_______________________________________________________________________________

def closest_carrot(grid, starting_row, starting_col)
  visited = Set.new([[starting_row, starting_col]])
  queue = [[starting_row, starting_col, 0]]

  while queue.length > 0
    row, col, distance = queue.shift

    return distance if grid[row][col] == "C"

    deltas = [[1,0],[-1,0],[0,1],[0,-1]]
    for delta in deltas
      delta_row, delta_col = delta
      neighbor_row = row + delta_row
      neighbor_col = col + delta_col

      row_inbounds = (0 <= neighbor_row && neighbor_row < grid.length)
      col_inbounds = (0 <= neighbor_col && neighbor_col < grid[0].length)

      pos = [neighbor_row, neighbor_col]

      if row_inbounds && col_inbounds && grid[neighbor_row][neighbor_col] != "X" && !visited.include?(pos)
        visited.add(pos)
        queue.push([neighbor_row, neighbor_col, distance + 1])
      end
    end
  end

  return -1
end

#_______________________________________________________________________________
