#STACK = DEPTH (RECURSIVE POSSIBLE)/ QUEUE = BREADTH
#n = number of nodes, O(n) time, O(n) space
def depth_first_print(graph, start)
  stack = [start]
  while stack.length > 0
    current = stack[-1]
    puts current
    stack.pop
    graph[current].each do |neighbor|
      stack << neighbor
    end
  end
end

#n = number of nodes, O(n) time, O(n) space
def depth_first_print_rec(graph, current) 
  puts current
  graph[current].each do |neighbor|
    depth_first_print(graph, neighbor)
  end
end

#__________________________________________

#n = number of nodes, O(n) time, O(n) space
def breadth_first_print(graph, start)
  queue = [ start ]
  while queue.length > 0
    current = queue.shift
    puts current
    graph[current].each do |neighbor|
      queue << neighbor
    end
  end
end

#________________________________________
# n = number of nodes, e = number edges, Time: O(e), Space: O(n)
def has_path(graph, src, dst)
  return true if src == dst

  graph[src].each do |neighbor|
    return true if has_path(graph, neighbor, dst) == true
  end

  return false
end

# n = number of nodes, e = number edges, Time: O(e), Space: O(n)
def has_path_breadth(graph, src, dst)
  queue = [src]

  while queue.length > 0
    current = queue.shift
    return true if current == dst
    graph[current].each do |neighbor|
      queue << neighbor
    end
  end
  return false
end
#_________________________________
#Undirected graph
#Turn edge list into a graph
#Depth first recursive
# n = number of nodes,e = number edges, Time: O(e), Space: O(e)

def undirected_path(edges, node_A, node_B)
  graph = build_graph(edges)
  return has_path_undirected_graph(graph, node_A, node_B, Set.new)
end

def has_path_undirected_graph(graph, src, dst, visited)

  return true if src == dst
  return false if visited.include?(src) #added later

  visited.add(src) #added later

  graph[src].each do |neighbor|
    if has_path_undirected_graph(graph, neighbor, dst, visited) == true
      return true
    end
  end

  return false
end

def build_graph(edges)
  graph = {}

  edges.each do |edge|
    a , b = edge

    graph[a] = [] if graph[a].nil?
    graph[b] = [] if graph[b].nil?

    graph[a] << b
    graph[b] << a
  end
  return graph
end

#______________________________________
#Depth first recursive
#n = number of nodes, e = number edges, Time: O(e), Space: O(n)
def connected_components_count(graph)
  visited = Set.new
  count = 0

  graph.each do |node, _|
    count += 1 if explore_graph(graph, node, visited) == true
  end

  return count
end

def explore_graph(graph, current , visited)
  return false if visited.include?(current)
  visited << current

  graph[current].each do |neighbor|
    explore_graph(graph, neighbor, visited )
  end

  return true
end
#________________________________________
#Depth first recursive
#n = number of nodes, e = number edges, Time: O(e), Space: O(n)
def largest_component(graph)
  visited = Set.new()
  largest = 0

  graph.keys.each do |node|
    size = explore_size(graph, node, visited)
    largest = size if size > largest
  end
  return largest
end

def explore_size(graph, node, visited)
  return 0 if visited.include?(node)
  visited << node
  size = 1
  graph[node].each do |neighbor|
    size += explore_size(graph, neighbor, visited)
  end
  return size
end
#_______________________________________________
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
      if !visited.include?(neighbor)
        visited.add(neighbor)
        queue << [neighbor, distance + 1]
      end
    end
  end

  return -1
end
#__________________________________________
#Depth first
# r = number of row c = number of columns Time: O(rc) Space: O(rc)
def island_count(grid)
  visited = Set.new
  count = 0

  grid.length.times do |r|
    grid[0].length.times do |c|
      count += 1 if explore_island(grid, r, c, visited) == true
    end
  end
  return count
end

def explore_island(grid, r, c, visited)
  row_inbounds = (0 <= r && r < grid.length)
  col_inbounds = (0 <= c && c < grid[0].length)

  return false if !row_inbounds || !col_inbounds #check if inbounds
  return false if grid[r][c] == 'W' #check if water
  pos = [r, c]
  return false if visited.include?(pos)#check if visited
  visited << pos

  explore_island(grid, r - 1, c, visited)
  explore_island(grid, r + 1, c, visited)
  explore_island(grid, r , c - 1, visited)
  explore_island(grid, r , c + 1, visited)

  return true
end

#_____________________________________________
#Depth first
# r = number of row c = number of columns Time: O(rc) Space: O(rc)
def minimum_island(grid)
  visited = Set.new
  min = Float::INFINITY
  grid.length.times do |r|
    grid[0].length.times do |c|
      size = explore_min(grid, r ,c, visited)
      min = size if size > 0 && min > size
    end
  end
  min
end

def explore_min(grid, r, c)
  row_inbounds = (0 <= r && r < grid.length)
  col_inbounds = (0 <= c && c < grid[0].length)

  return 0 if !row_inbounds || !col_inbounds
  return 0 if  grid[r][c] == "W"
  pos = [r, c]
  return 0 if visited.include?(pos)
  visited << pos

  size = 1
  size += explore_min(graph, r - 1, c, visited)
  size += explore_min(graph, r + 1, c, visited)
  size += explore_min(graph, r, c - 1, visited)
  size += explore_min(graph, r, c + 1, visited)
  size
end
#______________________________________________
# Breadth First, r = number of rows, c = number of columns, Time: O(rc), Space: O(rc)
def closest_carrot(grid, starting_row, starting_col)
  visited = Set.new([starting_row, starting_col])
  queue = [[starting_row, starting_col, 0]]

  while queue.length > 0
    row, col, distance = queue.shift

    return distance if grid[row][col] == "C"

    deltas = [[1,0],[-1,0],[0,1],[0,-1]]

    deltas.each do |delta|
      delta_row, delta_col = delta
      neighbor_row = row + delta_row
      neighbor_col = col + delta_col

      row_inbounds = (0 <= neighbor_row && neighbor_row < grid.length)
      col_inbounds = (0 <= neighbor_col && neighbor_col < grid[0].length)

      pos = [neighbor_row, neighbor_col]

      if row_inbounds && col_inbounds && grid[neighbor_row][neighbor_col] != "X" && !visited.include?(pos)
        queue << [neighbor_row, neighbor_col, distance + 1]
        visited << pos
      end
    end
  end
  -1
end
#_______________________________________________
# depth first
# e = # edges, n = # nodes, Time: O(e), Space: O(n)
def longest_path(graph)
  distance = {}
  
  graph.keys.each do |node|  #find terminal nodes
    if graph[node].length == 0
      distance[node] = 0
    end
  end

  graph.keys.each do |node|
    traverse_longest(graph, node, distance)
  end
  distance.values.max
end

def traverse_longest(graph, node, distance)
  return distance[node] if distance.include?(node)

  max_length = 0
  graph[node].each do |neighbor|
    attempt = traverse_longest(graph, neighbor, distance)
    max_length = attempt if attempt > max_length
  end

  distance[node] =  1 + max_length
  return distance[node]
end
#________________________________________
# depth first recurseive p = # prereqs c = # courses Time: O(p),Space: O(c)
def semesters_required(num_courses, prereqs)
  graph = build_directed_graph(num_courses, prereqs)
  distance = {}
  graph.keys.each do |course|
    distance[course] = 1 if graph[course].length == 0 #first find terminal nodes
  end

  graph.keys.each do |course|
    traverse_semesters(graph, course, distance)
  end
  distance.values.max
end

def traverse_semesters(graph,node,distance)
  return distance[node] if distance.include?(node)

  max_distance = 0
  graph[node].each do |neighbor|
    neighbor_distance = traverse_semesters(graph, neighbor, distance)
    max_distance = neighbor_distance if neighbor_distance > max_distance
  end
  distance[node] = max_distance + 1
  return distance[node]
end

def build_directed_graph(num_courses, prereqs)
  graph = {}

  (0...num_courses).each do |course|
    graph[course] = []
  end

  prereqs.each do |prereq|
    a , b = prereq
    graph[a] << b
  end
  graph
end
#__________________________________
#Iterate through island and call traverse_island recursive function on (grid, r, c, visited)
def best_bridge(grid)
  main_island = nil
  grid.length.times do |r|
    grid[0].length.times do |c|
      potential_island = traverse_island(grid, r, c, Set.new)
      
      if potential_island.length > 0
        main_island = potential_island
      end
    end
  end

  visited = Set.new(main_island)
  queue = [ ]
  main_island.each do |pos|
    r , c = pos
    queue << [r, c, 0] #0 to keep track of distance
  end

  while queue.length > 0
    r, c, distance = queue.shift

    return distance - 1 if grid[r][c] == 'L' && !main_island.include?([r,c])

    deltas = [[1,0],[-1,0],[0,1],[0,-1]]
    deltas.each do |delta|
    delta_row, delta_col = delta
    neighbor_row = r + delta_row
    neighbor_col = c + delta_col
    neighbor_pos = [neighbor_row, neighbor_col]

      if is_inbounds(grid, neighbor_row, neighbor_col) && !visited.include?(neighbor_pos)
        visited.add(neighbor_pos)
        queue << [neighbor_row, neighbor_col, distance + 1]
      end
    end
  end
end

#returns a visited set of coords [(0,0) (1,0)] etcc for main island
def traverse_island(grid, r, c, visited)
  return visited if is_inbounds(grid, r, c) == false #base case
  return visited if grid[r][c] == "W" #base case

  pos = [r, c]
  return visited if visited.include?(pos) #base case
  visited.add(pos)
  
  traverse_island(grid, r - 1, c, visited)
  traverse_island(grid, r + 1, c, visited)
  traverse_island(grid, r, c - 1, visited)
  traverse_island(grid, r, c + 1, visited)

  return visited
end

def is_inbounds(grid, r, c)
  row_inbounds = (0 <= r && r < grid.length)
  col_inbounds = (0 <= c && c < grid[0].length)
  return row_inbounds && col_inbounds
end

#____________________________________________
#White Grey Black algorithm

def has_cycle(graph)

end