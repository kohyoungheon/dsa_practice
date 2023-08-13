def contains_duplicate(nums)
  set = Set.new
  nums.each do |num|
    return true if set.include?(num)
    set << num
  end
  return false
end

# expect(is_anagram("anagram", "nagaram")).to eq(true)
def is_anagram(string_1, string_2)
  hash_1 = Hash.new(0)
  hash_2 = Hash.new(0)

  string_1.each_char do |char|
    hash_1[char] += 1
  end

  string_2.each_char do |char|
    hash_2[char] += 1
  end

  return hash_1 == hash_2
end

# expect(two_sum([2,7,11,15], 9)).to eq([0,1])
def two_sum(numbers, sum)
  prev_sums = {}
  numbers.each_with_index do |num, index|
    complement = sum - num
    return [prev_sums[complement], index] if prev_sums.include?(complement)
    prev_sums[num] = index
  end
end
# group_anagrams(["eat","tea","tan","ate","nat","bat"]).to eq [["eat", "tea", "ate"], ["tan", "nat"], ["bat"]]
def group_anagrams(strings)
 result = Hash.new{|h,k| h[k] = []}

 strings.each do |string|
  count = [0]* 26

  string.each_char do |char|
    count[char.ord - 'a'.ord] += 1
  end

  result[count] << string
 end
 return result.values
end
#________________________________________
# expect(top_k_frequent([3,3,3,3,3,3,3,2,2,5,5,5,5,5,5,5,5,5,1,1], 2)).to eq([5,3])
def top_k_frequent(nums, k)
  nums.tally.sort_by{|_, v|-v}.first(k).to_h.keys
end
#_______________________________________________

def product_except_self(nums)
  prefix = 1
  suffix = 1
  result = []

  nums.each do |num|
    result << prefix
    prefix *= num
  end

  (nums.length-1).downto(0) do |i|
    result[i] *= suffix
    suffix *= nums[i]
  end
  result
end
#_____________________________________________________
# "5#Hello5#world"
def encode(strings)
  result = ""
  strings.each do |string|
    result +=  string.length.to_s + "#" + string
  end
  result
end

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
  result
end
#__________________________________
def longest_consecutive(nums)
  set = Set.new(nums)
  longest = 0

  nums.each do |num|
    if !set.include?(num-1)
      length = 0
      while set.include?(num + length)
        length += 1
      end
      longest = [length, longest].max
    end
  end
  longest
end

#_____________________________________

def is_palindrome(string)
  return false if string.nil?

  i = 0
  j = string.length - 1

  while i < j
    while i < j && is_alphanumeric?(string[i]) == false
      i += 1
    end

    while j > i && is_alphanumeric?(string[j]) == false
      j -= 1
    end


    return false if string[i].downcase != string[j].downcase

    i += 1
    j -= 1
  end
  return true
end

def is_alphanumeric?(char)
  ('a'.ord <= char.ord && char.ord <= 'z'.ord) ||
  ('A'.ord <= char.ord && char.ord <= 'Z'.ord) ||
  ('0'.ord <= char.ord && char.ord <= '9'.ord) 
end

#_________________________________________________

def two_sum_ii(numbers, target)
  i = 0
  j = numbers.length - 1

  while i < j
    current_sum = numbers[i] + numbers[j]
    if current_sum > target
      j -= 1
    elsif current_sum < target
      i += 1
    else  
      return [i + 1, j + 1]
    end
  end
end

#_____________________________________
def three_sum(nums)
  result = []

  nums.sort!

  nums.each_with_index do |num, index|
    next if index > 0 && num == nums[index - 1]

    left = index + 1
    right = nums.length - 1

    while left < right
      three_sum = num + nums[left] + nums[right]

      if three_sum > 0
        right -= 1
      elsif three_sum < 0
        left += 1
      else
        result <<  [num, nums[left], nums[right]]

        left += 1
        left += 1 while left < right && nums[left] == nums[left-1]
      end
    end
  end
  result
end

#________________________________________________

def max_area(nums)
  i = 0
  j = nums.length - 1
  max_area = 0

  while i != j
    area = [nums[i], nums[j]].min * (j - i)
    max_area = area if area > max_area

    if nums[i] > nums[j]
      j -= 1
    else
      i += 1
    end
  end
  max_area
end

#________________________________________

def max_profit(nums)
  left = 0
  right = 1
  max_profit = 0

  while right < nums.length
    if nums[left] < nums[right]
      profit = nums[right] - nums[left]
      max_profit = profit if profit > max_profit
    else
      left =right
    end
    right += 1
  end
  max_profit
end
#_______________________________________-
def length_of_longest_substring(string)
  set = Set.new
  left = 0
  longest = 0

  string.each_char do |char|
    while set.include?(char)
      set.delete(string[left])
      left += 1
    end
    set.add(char)
    longest = [set.length, longest].max
  end
  longest
end
#________________________________________

def character_replacement(string, k)
  hash = Hash.new(0)
  left = 0
  result = 0
  max_f = 0

  (0...string.length).each do |right|
    hash[string[right]] += 1
    max_f = [hash[string[right]],max_f].max

    if (right - left + 1) - max_f > k
      hash[string[left]] -= 1
      left += 1
    end

    result = [result, (right-left + 1)].max
  end
  result
end