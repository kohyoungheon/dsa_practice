# Space = O(1)
# Time = O(n)
def max_profit(prices)
  left = 0 #buying price
  right = 1 #selling price
  max_profit = 0

  while right < prices.length

    if prices[left] < prices[right]
      profit = prices[right] - prices[left]
      max_profit = profit if profit > max_profit
    else
      left = right
    end

    right += 1
  end
  return max_profit
end
#_______________________________________________________________________________
# Time :O(n) Space: O(min(n, m)) n =string size, m = charset size
def length_of_longest_substring(string)
  set = Set.new
  left = 0
  result = 0

  string.each_char do |char|
    while set.include?(char)
      set.delete(string[left])
      left += 1
    end
    set.add(char)
    result = [result, set.length].max
  end
  result
end
#_______________________________________________________________________________

def character_replacement(string, k)
  count = Hash.new(0)
  l = 0
  maxf = 0
  result = 0
  (0...string.length).each do |r|
    count[string[r]] += 1
    maxf = [maxf, count[string[r]]].max

    if (r - l + 1) - maxf > k #(r-1+1) = window size
      count[string[l]] -= 1
      l += 1
    end

    result = [result, r - l + 1].max #(r-1+1) = window size
  end

  result
end