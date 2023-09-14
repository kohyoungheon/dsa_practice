# Time: O(log N), space O(1)
# [3,4,5,1,2]
def find_min(nums)
  left = 0
  right = nums.size - 1
  while left < right
    mid = left + (right-left)/2
    if nums[mid] > nums[right]
      left = mid + 1
    else
      right = mid
    end
  end
  nums[right]
end
#_______________________________________
# ([4,5,6,7,0,1,2], 0 ).to eq(4)
def search(nums, target)
  left = 0
  right = nums.length - 1

  
  while left <= right
    mid = left + (right - left)/2
    return mid if (nums[mid] == target)
    
    if nums[left] <= nums[mid]#left portion
      if target <= nums[mid] && target >= nums[left]
        right = mid - 1
      else
        left = mid + 1
      end
      
    else #right portion
      if nums[mid] <= target && target <= nums[right]
        left = mid + 1
      else
        right = mid - 1
      end
    end

  end
  return -1
end

#______________________________________
# Input: nums = [-1,0,3,5,9,12], target = 9
# Output: 4
def search_unrotated(nums, target)
  left = 0
  right = nums.length - 1

  while left <= right # greater than or equal to.
    mid = (left + right)/2

    if nums[mid] == target
      return mid
    elsif nums[mid] < target
      left = mid + 1
    else
      right = mid - 1
    end
  end
  -1
end

#_________________________________________
def search_matrix(matrix, target)
  rows = matrix.length
  cols = matrix[0].length

  top = 0
  bottom = rows - 1

  while top <= bottom
    row = (top + bottom) / 2
    if target > matrix[row][-1]
      top = row + 1
    elsif target < matrix[row][0]
      bottom = row - 1
    else
      break
    end
  end

  return false if !(top <= bot)
  row = (top + bottom) / 2
  l = 0
  r= cols - 1

  while l <= res
    m = (l+r)/2
    if target > matrix[row][m]
      l = m + 1
    elsif target < matrix[row][m]
      r = m - 1
    else
      return true
    end
  end

  false
end
#________________________________
#koko eating banana
# Input: piles = [3,6,7,11], h = 8
# Output: 4
def min_eating_speed(piles, h)
  l, r = 1, piles.max
  res = r

  while l <= r
    k = (l + r) / 2

    total_time = 0
    piles.each do |p|
      total_time += (p / k).ceil
    end

    if total_time <= h
      res = k
      r = k - 1
    else
      l = k + 1
    end
  end
  res
end
