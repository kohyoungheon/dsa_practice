# Space = O(1)
# Time = O(n)
def max_profit(prices)
  i = 0
  j = 1
  max_profit = 0

  while j < prices.length
    if prices[i] < prices[j]
      profit = prices[j] - prices[i]
      max_profit = profit if profit > max_profit
    else
      i = j
    end
    j+= 1
  end
  max_profit
end
#_______________________________________________________________________________
# Time :O(n) Space: O(min(n, m)) n =string size, m = charset size
# longest without repeating char
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

#_______________________________________________
# Input: s1 = "ab", s2 = "eidbaooo"
# Output: true
def check_inclusion(s1, s2)
  return false if s1.length > s2.length

  hash = Hash.new(0)
  s1.each_char { |c| hash[c] += 1 }

  s2.each_char.with_index do |c, i|
    hash[c] -= 1

    #update sliding window because i is greater than s1.length
    if i >= s1.length
      hash[s2[i - s1.length]] += 1
    end

    return true if hash.values.all?(0)
  end
  false
end

#_________________________________-
# Input: nums = [1,12,-5,-6,50,3], k = 4
# Output: 12.75000
# Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75
def find_max_average(nums, k)
  total = 0.0
  answer = 0.0

  (0..k-1).each do |i|
    total += nums[i]
  end
  answer = total / k

  (k..nums.length - 1 ).each do |i|
    total -= nums[i - k]
    total += nums[i]
    answer = [answer, total / k].max
  end
  answer
end
#___________________________________________-
# Input: target = 7, nums = [2,3,1,2,4,3]
# Output: 2
# Explanation: The subarray [4,3] has the minimal length under the problem constraint.