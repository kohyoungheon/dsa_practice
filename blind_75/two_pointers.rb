# Time Complexity: O(n), where n is the length of the input string.
# Space Complexity: O(1), constant space usage.
def is_palindrome(string)
  return false if string.nil?
  return false if string.empty?
  i = 0
  j = string.length - 1

  while i < j
    while i < j && alphaNumeric?(string[i]) == false
      i += 1
    end

    while j > i && alphaNumeric?(string[j]) == false
      j -= 1
    end

    return false if string[i].downcase != string[j].downcase
    i += 1
    j -= 1
  end
  return true
end

def alphaNumeric?(character)
  ('A'.ord <= character.ord && character.ord <= 'Z'.ord) ||
  ('a'.ord <= character.ord && character.ord <= 'z'.ord) ||
  ('0'.ord <= character.ord && character.ord <= '9'.ord)
end
#_________________________________
# Time Complexity: O(n), Space Complexity: O(1)
def two_sum_ii(nums, target)
  left = 0
  right = nums.length - 1

  while left < right
    currentSum = nums[left] + nums[right]
    if currentSum > target
      right -= 1
    elsif currentSum < target
      left += 1
    else
      return [left + 1, right + 1]
    end
  end
  return []
end

#______________________________________________________
# Time complexity of the provided code is O(n^2), and the space complexity is O(n).
#return all the triplets that equal 0
#[-1, 0, 1, 2, -1, -4].to eq[-1, 0, 1], [-1, -1, 2]
def three_sum(nums)
  result = []
  nums.sort! # Sort the array in-place to simplify the logic

  nums.each_with_index do |num, index|
    next if index > 0 && num == nums[index - 1] # Avoid duplicates

    left = index + 1 #index + 1 ensures you consider elements that haven't been considered before for the current num.
    right = nums.length - 1

    while left < right
      three_sum = num + nums[left] + nums[right]

      if three_sum > 0
        right -= 1
      elsif three_sum < 0
        left += 1
      else
        result << [num, nums[left], nums[right]]
        
        r -= 1
        left += 1
        left += 1 while nums[left] == nums[left - 1] && left < right #skips duplicates and ensure it doesnt pass right pointer.
      end
    end
  end
  result
end
#___________________________________________
# Time complexity of the provided code is O(n), and the space complexity is O(1).
#n is the length of the input array height.
#container with most water
#Brute Force O(n^2)
def max_area(height)
  i = 0
  j = height.length - 1
  maxArea = 0
  while i != j
    area = ([height[i], height[j]].min * (j - i))
    if area > maxArea
        maxArea = area
    end
    if height[i] > height[j]
        j -= 1
    else
        i += 1
    end
  end
  return maxArea
end
#_________________________________________________
