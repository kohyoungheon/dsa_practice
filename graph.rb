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

def depth_first_print_rec(graph, current) 
  puts current
  graph[current].each do |neighbor|
    depth_first_print(graph, neighbor)
  end
end

#__________________________________________

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

