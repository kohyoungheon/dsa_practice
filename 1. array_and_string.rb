def uncompress(string)
  #expect(uncompress("2c3a1t")).to eq('ccaaat')
  result = ""
  numbers = "1234567890"
  i=0
  j=0
  while j < string.length do
    if numbers.include?(string[j])
      j = j + 1
    else
      number = string[i...j].to_i
      result += string[j] * number
      j = j + 1
      i = j
    end
  end
  result
end

def compress(string)
  #expect(compress('ccaaatsss')).to eq("2c3at3s")
  string += '!'
  result = ''
  i = 0
  j = 0
  while j < string.length
    if string[i] == string[j]
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

def anagrams?(string_1,string_2)
  #expect(anagrams?('restful', 'fluster')).to eq(true)
  hash_1 = Hash.new(0)
  hash_2 = Hash.new(0)
  string_1.each_char do |char|
    hash_1[char] += 1
  end
  string_2.each_char do |char|
    hash_2[char] += 1
  end
  hash_1 == hash_2
end

def most_frequent_char(string)
  #expect(most_frequent_char('bookeeper')).to eq('e')
  hash = Hash.new(0)
  string.each_char do |char|
    hash[char] += 1
  end
  best = nil
  string.each_char do |char|
    if best == nil || hash[char] > hash[best]
      best = char
    end
  end
  best
end

def pair_sum(numbers,target_sum)
  #expect(pair_sum([4, 7, 9, 2, 5, 1], 5)).to eq([0, 5])

  #Hash Method
  previous_nums = {}

  numbers.each_with_index do |number, index|
    complement = target_sum - number

    if previous_nums.include?(complement)
      return [previous_nums[complement],index]
    end

    previous_nums[number] = index

    #Brute Force Method
  # (0..numbers.length-1).each do |i|
  #   (i+1..numbers.length-1).each do |j|
  #     if numbers[i] + numbers[j] == target_sum
  #       return [i,j]
  #     end
  #   end
  # end
  end
end

def pair_product(numbers, target_product)
  #expect(pair_product([3, 2, 5, 4, 1], 8)).to eq([1,3])
  previous_nums = {}

  numbers.each_with_index do |number, index|
    complement = target_product / number

    if previous_nums.include?(complement)
      return ([previous_nums[complement],index])
    end

    previous_nums[number] = index
  end
end

def intersection(array_1,array_2)
  result = []
  set = {}
  array_1.each_with_index do |num,index|
    set[num] = index
  end

  array_2.each do |num|
    if set.include?(num)
      result << num
    end
  end
  result
end

def five_sort(array)
end