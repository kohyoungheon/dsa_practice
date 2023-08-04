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

  graph.each do |node, _|
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
