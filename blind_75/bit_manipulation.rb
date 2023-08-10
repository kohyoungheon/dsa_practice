#O(32) because 32 bits.
def hamming_weight(n)
  res = 0
  while n > 0
    res += n % 2
    n >>= 1
  end
  res
end
#______________________________________
#give a number, return an array that counts how many 1's are in each bit representation up to that number
# Input: n = 5
# Output: [0,1,1,2,1,2]
# Explanation:
# 0 --> 0 # zero 1's
# 1 --> 1 # one 1's
# 2 --> 10 # one 1's
# 3 --> 11 # two 1's
# 4 --> 100 # one 1's
# 5 --> 101 # two 1's
def count_bits(n)
  dp = [0] *(n+1)
  offset = 1
  (1..n).each do |i|
      offset = i if (offset * 2 == i)
      dp[i] = 1  + dp[i-offset]
  end
  return dp
end