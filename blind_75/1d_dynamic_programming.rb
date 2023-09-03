def climb_stairs(n)
  one = 1
  two = 1

  n.times do 
    temp = one
    one = one + two
    two = temp
  end
  one
end
#_________________________________________________
# Input: cost = [10,15,20]
# Output: 15
# Explanation: You will start at index 1.
# - Pay 15 and climb two steps to reach the top.
# The total cost is 15.
def min_cost_climbing_stairs(cost)
  for i in (cost.length - 3).downto(0)
    cost[i] += [cost[i + 1], cost[i + 2]].min
  end

  [cost[0], cost[1]].min
end
#_________________________________________________
#nums = [1,2,3,1]
def house_robber(nums)
  rob1 = 0
  rob2 = 0

  nums.each do |n|
    temp = [n + rob1, rob2].max
    rob1 = rob2
    rob2 = temp
  end
  rob2
end

#__________________________________________
def house_robber_2(nums)
  return 0 if nums.empty?

  if nums.length == 1
    return nums[0]
  end
    # Scenario 1: Include the first house and exclude the last house
    max1 = rob_helper(nums[0..-2])

    # Scenario 2: Exclude the first house and include the last house
    max2 = rob_helper(nums[1..-1])
  
    # Return the maximum result from the two scenarios
    return [max1, max2].max
end

#________________________________________________________
def longest_palindrome(s)
  res = ""
  res_len = 0

  s.length.times do |i|
    # Odd length
    l, r = i, i
    while l >= 0 && r < s.length && s[l] == s[r]
      if (r - l + 1) > res_len
        res = s[l..r]
        res_len = r - l + 1
      end
      l -= 1
      r += 1
    end

    # Even length
    l, r = i, i + 1
    while l >= 0 && r < s.length && s[l] == s[r]
      if (r - l + 1) > res_len
        res = s[l..r]
        res_len = r - l + 1
      end
      l -= 1
      r += 1
    end
  end

  res
end
#__________________________________________________s
def count_substrings(s)
  res = 0

  s.length.times do |i|
    res += count_pali(s, i, i)
    res += count_pali(s, i, i + 1)
  end

  res
end

def count_pali(s, l, r)
  res = 0

  while l >= 0 && r < s.length && s[l] == s[r]
    res += 1
    l -= 1
    r += 1
  end

  res
end
#_____________________________________________
def max_product(nums)
  # Initialize variables
  res = nums[0]
  cur_min = 1
  cur_max = 1

  nums.each do |n|
    tmp = cur_max * n
    cur_max = [n * cur_max, n * cur_min, n].max
    cur_min = [tmp, n * cur_min, n].min
    res = [res, cur_max].max
  end

  return res
end
#______________________________________________
# Input: nums = [10,9,2,5,3,7,101,18]
# Output: 4
# Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
def length_of_lis(nums)
  lis = [1] * nums.length

  (nums.length - 1).downto(0) do |i|
    (i + 1).upto(nums.length - 1) do |j|
      if nums[i] < nums[j]
        lis[i] = [lis[i], 1 + lis[j]].max
      end
    end
  end

  lis.max
end

