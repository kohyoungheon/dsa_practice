def dfs(matrix, i, j, visited)
  visited[i][j] == true
  dfs(matrix, i-1, j, visited) if i-1 > 0 && !visited.include?[i-1][j] && matrix[i-1][j] >= matrix[i][j]
  dfs(matrix, i+1, j, visited) if i+1 <= matrix.length && !visited.include?[i+1][j] && matrix[i+1][j] >= matrix[i][j]
  dfs(matrix, i, j-1, visited) if j-1 > 0 && !visited.include?[i][j-1] && matrix[i][j-1] >= matrix[i][j]
  dfs(matrix, i, j+1, visited) if j+1 <= matrix[0].length && !visited.include?[i][j+1] && matrix[i][j+1] >= matrix[i][j]
end

def pacific_atlantic(matrix)
  return [] if matrix.nil?
  atl = Array.new(matrix.length) { Array.new(matrix[0].length, false) }
  pac = Array.new(matrix.length) { Array.new(matrix[0].length, false) }

  #left side pacific
  for i in 0...matrix.length
    dfs(matrix, i, 0, pac)
  end
  #top side pacific
  for j in 0...matrix[0].length
    dfs(matrix, 0, j, pac)
  end
  #right side atlantic
  for i in 0...matrix.length
    dfs(matrix, i, matrix[0].length - 1, atl)
  end
  #bottom side atlantic
  for j in 0...matrix[0].length
    dfs(matrix, matrix.length-1, j, atl)
  end

  res = []
  matrix.length.times do |r|
    matrix[0].length.times do |c|
      res << [r,c] if atl[r][c] && pac[r][c]
    end
  end

  res
end