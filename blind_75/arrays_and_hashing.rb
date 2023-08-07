#Space = O(n), where n is the number of elements in nums.
#Time = O(n)
def contains_duplicate(nums)
  set = Set.new
  nums.each do |num|
    return true if set.include?(num)
    set << num
  end
  return false
end
#______________________________________
# Space Complexity: O(m+n) or O(1) if considering only ASCII characters.
# Time Complexity: O(m+n)
# M = length of string_1,  N = length of string_2
def is_anagram(string_1, string_2)
  
  return false if string_1.length != string_2.length

  hash_1 = Hash.new(0)
  hash_2 = Hash.new(0)

  string_1.each_char do |c|
    hash_1[c] += 1
  end

  string_2.each_char do |c|
    hash_2[c] += 1
  end

  return hash_1 == hash_2
end

#______________________________________
#n = length of numbers list, Time: O(n), Space: O(n)
#expect(pair_sum([4, 7, 9, 2, 5, 1], 5)).to eq([0, 5])
def two_sum(numbers, sum)
  previous_nums = {}
  numbers.each_with_index do |number, index|
    complement = sum - number
    return [previous_nums[complement], index] if previous_nums.include?(complement)

    previous_nums[number] = index
  end
end

#_______________________________
# Time = O(NM), Space = O(NM)
def group_anagrams(strings)
  res = Hash.new { |hash, key| hash[key] = [] }
  
  strings.each do |string|
    count = [0] * 26
    string.each_char do |char|
      count[char.ord - "a".ord] += 1
    end

    res[count] << string
  end
  return res.values
end
#Time =  O(NMlogM), N = number of strings, M = maximum length of a string among the input strings.
#Space = O(NM)
def group_anagrams_(strs)
  anagram_groups = Hash.new { |hash, key| hash[key] = [] }
  
  strs.each do |str|
    sorted = str.chars.sort.join
    anagram_groups[sorted] << str
  end
  
  anagram_groups.values
end
#_________________________________
#Space Complexity: O(n) n is the number of elements in nums
#Time Complexity: O(n log n)
# top_k_frequent([1,1,1,2,2,3], 2)).to eq([1,2])
def top_k_frequent(nums, k)
  hash = Hash.new(0)
  nums.each do |num|
    hash[num] += 1
  end
  sorted = hash.sort_by { |_, v| -v } #sorting by negative value (-v) to ensure it's in descending order
  sorted.map(&:first).take(k) #same as sorted.map{|n| n.first }
end

def _top_k_frequent(nums, k)
  
end