#n = length of list, Time: O(n), Space: O(1)
def max_value(numbers)
  max = -1.0/0.0

  numbers.each do |number|
    max = number if number > max
  end
  max
end
#__________________________________________________________
#n = input number, Time: O(square_root(n)), Space: O(1)
def is_prime?(number)
  return false if number < 2

  (2..number-1).each do |x|
    return false if number % x == 0
  end

  return true
end
#______________________________________________________________________________________
#n = number of groups, m = max num found in any group, Time: O(n*m), Space: O(n*m)
def uncompress(string)
  result = ""
  numbers = "0123456789"
  i = 0
  j = 0

  while j < string.length
    if numbers.include?(string[j])
      j = j + 1 
    else
      num = string[i...j].to_i
      result += string[j] * num
      j = j + 1
      i = j
    end 
  end
  result
end
#____________________________________________________________
# n = length of string, Time: O(n),Space: O(n)
def compress(string)
  string += '!'
  result = ''
  j = 0
  i = 0

  while j < string.length
    if string[j] == string[i]
      j = j + 1 
    else
      num = j - i
      if num == 1
        result += string[i]
      else
        result += num.to_s + string[i]
      end
      i = j
    end
  end
  result
end
#_____________________________________________________________________
# n = length of string 1, m = length of string 2, Time: O(n + m), Space: O(n + m)
def anagrams?(s1, s2)
  hash_1 = Hash.new(0)
  hash_2 = Hash.new(0)
  s1.each_char do |char|
    hash_1[char] += 1
  end

  s2.each_char do |char|
    hash_2[char] += 1
  end

  return hash_1 == hash_2
end
#______________________________________________________
# n = length of string, Time: O(n), Space: O(n)
def most_frequent_char(string)
  hash = Hash.new(0)
  string.each_char do |char|
    hash[char] += 1
  end

  most_frequent = hash.max_by { |letter, value| value }[0]
  
  # most_frequent = nil
  # string.each_char do |char|
  #   if most_frequent = nil || hash[char] > hash[most_frequent]
  #     most_frequent = char
  #   end
  # end
  # most_frequent
end
#___________________________________________________________
#n = length of numbers list, Time: O(n), Space: O(n)
def pair_sum(numbers, target_sum)
  prev_nums = Hash.new

  numbers.each_with_index do |number, index|
    complement = target_sum - number

    if prev_nums.include?(complement)
      return [prev_nums[complement], index]
    end

    prev_nums[number] = index
  end
end
#__________________________________________________
#n = length of numbers list, Time: O(n), Space: O(n)
def pair_product(numbers, target_product)
  prev_nums = Hash.new

  numbers.each_with_index do |number, index|
    complement = target_product / number

    if prev_nums.include?(complement)
      return [prev_nums[complement], index]
    end

    prev_nums[number] = index
  end
end
#________________________________________________
# n = length of array a, m = length of array b, Time: O(n*m), Space: O(min(n,m))
def intersection(array_1, array_2)
  result = []
  set = Set.new

  array_1.each do |number|
    set << number
  end

  array_2.each do |number|
    result << number if set.include?(number)
  end

  result
end
#_____________________________________________________
# n = array size, Time: O(n), Space: O(1)
def five_sort(nums)
  i = 0
  j = nums.length - 1
  while i <= j 
    if nums[j] == 5
      j -= 1
    elsif nums[i] == 5
      nums[i], nums[j] = nums[j], nums[i]
      i += 1
    else
      i += 1
    end
  end
  return nums
end