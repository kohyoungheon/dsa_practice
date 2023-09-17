# 1343. Number of Sub-arrays of Size K and Average Greater than or Equal to Threshold
# Input: arr = [2,2,2,2,5,5,5,8], k = 3, threshold = 4
                    k
# Output: 3
# Explanation: Sub-arrays [2,5,5],[5,5,5] and [5,5,8] have averages 4, 5 and 6 respectively. All other sub-arrays of size 3 have averages less than 4 (the threshold).
def num_of_subarrays(arr, k, threshold)
  res = 0
  cur_sum = arr[0...k - 1].sum

  (0..arr.length - k).each do |l|
    cur_sum += arr[l + k - 1]
    if (cur_sum.to_f / k) >= threshold
      res += 1
    end
    cur_sum -= arr[l]
  end

  res
# end
# 567. Permutation in String
# Input: s1 = "ab", s2 = "eidbaooo"
# Output: true
# Explanation: s2 contains one permutation of s1 ("ba").
def check_inclusion(s1, s2)
  return false if s1.length > s2.length

  hash = Hash.new(0)
  s1.each_char { |c| hash[c] += 1 }

  s2.each_char.with_index do |c, i|
    hash[c] -= 1
    #update sliding window because i is greater than s1.length
    hash[s2[i - s1.length]] += 1 if i >= s1.length
    return true if hash.values.all?(0)
  end
  false
end
# 1838. Frequency of the Most Frequent Element
# Input: nums = [1,2,4], k = 5
# Output: 3
# Explanation: Increment the first element three times and the second element two times to make nums = [4,4,4].
# 4 has a frequency of 3.
def max_frequency(nums, k)
    
end