# Valid Palindrome 2
# Input: s = "abca"
# Output: true
# Explanation: You could delete the character 'c'.
def valid_palindrome(s)
  i, j = 0, s.length - 1

  while i < j
    if s[i] == s[j]
      i += 1
      j -= 1
    else
      return valid_palindrome_util(s, i + 1, j) || valid_palindrome_util(s, i, j - 1)
    end
  end

  true
end

def valid_palindrome_util(s, i, j)
  while i < j
    if s[i] == s[j]
      i += 1
      j -= 1
    else
      return false
    end
  end

  true
end

# Minimum Difference Between Highest and Lowest of K Scores
# Input: nums = [9,4,1,7], k = 2
# Output: 2
# Explanation: There are six ways to pick score(s) of two students:
# The minimum possible difference is 2.
def minimum_difference(nums, k)
  nums.sort!
  min = Float::INFINITY
  l = 0
  r = k - 1
  while r < nums.length
    res = nums[r] - nums[l]
    min = [res, min].min
    l += 1
    r += 1
  end
  min
end
# Merge Strings Alternately
# Input: word1 = "ab", word2 = "pqrs"
# Output: "apbqrs"
# Explanation: Notice that as word2 is longer, "rs" is appended to the end.
# word1:  a   b 
# word2:    p   q   r   s
# merged: a p b q   r   s
def merge_alternately(word1, word2)
  i = 0
  j = 0
  res = ""
  while i < word1.length && j < word2.length
    res += word1[i]
    res += word2[j]
    i += 1
    j += 1
  end

  res += word1[i..-1] if i < word1.length
  res += word2[j..-1] if j < word2.length
  res
end
# 344. Reverse String
# Input: s = ["h","e","l","l","o"]
# Output: ["o","l","l","e","h"]
def reverse_string(s)
  l = 0
  r = s.length - 1

  while l < r
    s[l],s[r] = s[r], s[l]
    l += 1
    r -= 1
  end
end