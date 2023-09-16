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
# 88. Merge Sorted Array
# Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
# Output: [1,2,2,3,5,6]
# Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
# The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
def merge(nums1, m, nums2, n)
  #last index
  last = m + n - 1

  #merge in reverse order
  while m > 0 && n > 0
    if nums1[m - 1] > nums2[n - 1]
      nums1[last] = nums1[m - 1]
      m -= 1
    else
      nums1[last] = nums2[n-1]
      n -= 1
    end
    last -= 1
  end
  #fill nums1 with leftover nums2 elements
  while n > 0
    nums1[last] = nums2[n-1]
    n = n - 1
    last = last - 1
  end
end
# Move Zeroes
# Input: nums = [0,1,0,3,12]
# Output: [1,3,12,0,0]
def move_zeroes(nums)
  l = 0
  r = 0

  while r < nums.length
    if nums[r] != 0 #is a number
      nums[l], nums[r] = nums[r], nums[l]
      l += 1
    end
    r += 1
  end

  nums
end
# 26. Remove Duplicates from Sorted Array
# Input: nums = [0,0,1,1,1,2,2,3,3,4]
# Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]
# Explanation: Your function should return k = 5, with the first five elements of nums being 0, 1, 2, 3, and 4 respectively.
# It does not matter what you leave beyond the returned k (hence they are underscores).
def remove_duplicates(nums)
  l = 1

  (1...nums.length).each do |r|
    if nums[r] != nums[r - 1]
      nums[l] = nums[r]
      l += 1
    end
  end

  l
end
# 80. Remove Duplicates from Sorted Array II
# Input: nums = [0,0,1,1,1,1,2,3,3]
# Output: 7, nums = [0,0,1,1,2,3,3,_,_]
# Explanation: Your function should return k = 7, with the first seven elements of nums being 0, 0, 1, 1, 2, 3 and 3 respectively.
# It does not matter what you leave beyond the returned k (hence they are underscores).
def remove_duplicates(nums)
  l, r = 0, 0

  while r < nums.length
    count = 1
    while r + 1 < nums.length && nums[r] == nums[r + 1]
      r += 1
      count += 1
    end

    [2, count].min.times do
      nums[l] = nums[r]
      l += 1
    end

    r += 1
  end

  l
end
