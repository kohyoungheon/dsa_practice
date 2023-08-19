# Input: candidates = [2,3,6,7], target = 7
def combination_sum(candidates, target)
  @result = []
  @target = target
  @candidates = candidates

  def dfs(i, current, total)

    if total == @target
        @result.append(current.dup())
        return
    end

    if i >= @candidates.length() || total > @target
        return
    end

    current.append(@candidates[i])
    dfs(i, current, total + @candidates[i])
    current.pop()
    dfs(i+1, current, total)
  end
  
  dfs(0,[],0)
  return @result
end
#_______________________________________________________________________
# Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
def exist(board, word)
  @rows = board.length
  @cols = board[0].length
  @path = Set.new() #same as visited

  @board = board
  @word = word

  set1 = @board.flatten.to_set
  set2 = @word.split('').to_set
  return false if !(set1 >= set2)

  def dfs(r,c,i)
    return true if i == @word.length()
    return false if (r<0 || c<0 || r >= @rows || c >= @cols || @word[i] != @board[r][c] || @path.include?([r,c]))

    @path.add([r,c])

    result = (dfs(r+1,c,i+1) ||
              dfs(r-1,c,i+1) ||
              dfs(r,c+1,i+1) ||
              dfs(r,c-1,i+1)
              )
    
    @path.delete([r,c])

    return result
  end

  (0..@rows-1).each do |r|
    (0..@cols-1).each do |c|
        return true if dfs(r,c,0)
    end
  end

  return false
  
end