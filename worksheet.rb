def connected_components_count(graph)
  count = 0
  visited = Set.new

  graph.keys.each do |node|
    count += 1 if explore_graph(graph,node,visited) == true
  end
  count
end

def explore_graph(graph, current, visited)
  return false if visited.include?(current)

  visited.add(current)
  graph[current].each do |neighbor|
    explore_graph(graph,neighbor, visited)
  end

  return true
end