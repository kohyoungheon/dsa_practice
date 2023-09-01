def combination_sum(candidates, target)
  @candidates = candidates
  @target = target
  @res = []

    def dfs(index, current, total)
      if @target == total
        @res << current.dup
        return
      end

      if @target < total || index > @candidates.length
        return
      end

      current << @candidates[i]
      dfs(index + 1, current, total + @candidates[i])
      current.pop
      dfs(index, current, total)
      
    end

  dfs(0,[],0)
  @res
end

def exist(board, word)
  @board = board
  @word = word

  @rows = board.length
  @cols = board[0].length
  @visited = Set.new

  set1 = @board.flatten.to_set
  set2 = @word.split('').to_set

  return false if !(set1 >= set2)

    def dfs(r,c,i)

      return true if i == @word.length
      return false if (0 > r || 0 > c || r >= @board.length || c >= @board[0].length || @board[r][c] != @word[i] || @path.include?([r,c]))

      @path.add([r,c])

      result =  (
                  dfs(r-1,c,i+1)||
                  dfs(r+1,c,i+1)||
                  dfs(r,c-1,i+1)||
                  dfs(r,c+1,i+1)
                )

      @path.delete([r,c])
      result
    end



  (0..8).each do |r|
    (0..8).each do |c|
      return true if dfs(r,c,0)
    end
  end
  return false
end