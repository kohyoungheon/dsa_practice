def max_depth_bfs(root)
  return 0 if root.nil?
  queue = [root]
  level = 0

  while queue.length > 0
    queue.length.times do |i|
      node = queue.shift

      queue << node.left if node.left
      queue << node.right if node.right

    end
    level += 1
  end
  level
end