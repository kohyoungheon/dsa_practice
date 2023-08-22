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
# expect(group_anagrams(["eat","tea","tan","ate","nat","bat"])).to eq([["eat", "tea", "ate"], ["tan", "nat"], ["bat"]])
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

# nums.tally.sort_by { |_, v| -v }.first(k).to_h.keys -> shorthand 1 line

def top_k_frequent(nums, k)
  array = Array.new(nums.length + 1){[]}
  count = Hash.new(0)
  nums.each do |num|
    count[num] += 1
  end
  
  
  count.each do |key, value|
    array[value] << key
  end
  
  result = []

  (array.length - 1).downto(0) do |i|
    result << array[i] unless array[i].empty?
  end
  result.flatten.take(k)
end
#______________________________________--
# Time complexity: 0(n), Space complexity: 0(n)
# expect(product_except_self([1,2,3,4])).to eq([24,12,8,6])
def product_except_self(nums) #[1,2,3,4]
  suffix = 1
  prefix = 1
  product = []
  # [1,1,2,6]

  # Calculate product to the right
  nums.each do |n| #[1,2,3,4]
    product << prefix
    prefix *= n
  end

  # Calculate product to the left
  (nums.length - 1).downto(0) do |i|
    require 'pry'; binding.pry
    product[i] *= suffix
    suffix *= nums[i]
  end
  return product
end

#___________________________________
# encode function:
# Time Complexity: O(n), where n is the total length of all input strings combined.
# Space Complexity: O(n), due to the result string.
#   ["Hello", "world"]
def encode(strings)
  result = ""
  strings.each do |string|
    result += string.length.to_s + "#" + string
  end
  return result
end
# decode function:
# Time Complexity: O(m * k), where m is the length of the encoded string and k is the number of substrings.
# Space Complexity: O(k), due to the result list.
#   "5#Hello5#world"
def decode(string)
  result = []
  i = 0

  while i < string.length
    j = i

    while string[j] != "#"
      j += 1
    end
    length = string[i...j].to_i

    result << string[j + 1..j + length]

    i = j + 1 + length
  end
  return result
end

#____________________________________
# Space/Time = O(n), n = size of input array
def longest_consecutive(nums)
  set = Set.new(nums)
  longest = 0

  nums.each do |num|
    if !set.include?(num - 1)
      length = 0
      while set.include?(num + length)
        length += 1
      end
      longest = [length, longest].max
    end
  end
  return longest
end

#______________________________