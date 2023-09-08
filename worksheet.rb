# @param {Character[][]} grid
# @return {Integer}
def number_of_islands(grid)
  count = 0

  grid.length.times do |r|
    grid[0].length.times do |c|
      count += 1 if explore_island(r,c,grid,visited) == true
    end
  end
  count
end

def explore_island(r,c,grid,visited)
  return false if grid[r][c] == '0'
end