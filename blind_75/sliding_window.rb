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
#Time:O(n), and the space complexity is O(1).
def character_replacement(s, k)
  l = 0
  r = 0
  max = 0
  hash = Hash.new(0)

  while r < s.length do 
    char = s[r]
    hash[char] += 1

    while (r - l + 1) - hash.values.max > k do 
      hash[s[l]] -= 1
      l += 1
    end

    max = [max, r - l + 1].max

    r += 1
  end

  max
end
