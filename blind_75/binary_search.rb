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
  l = 0
  r = nums.length - 1
  while l <= r
    mid = (l + r) / 2
    mid = mid.to_i  # Ensure mid is an integer
    if target == nums[mid]
      return mid
    end
    # Left sorted portion
    if nums[l] <= nums[mid]
      if target > nums[mid] || target < nums[l]
        l = mid + 1
      else
        r = mid - 1
      end
    # Right sorted portion
    else
      if target < nums[mid] || target > nums[r]
        r = mid - 1
      else
        l = mid + 1
      end
    end
  end
  return -1
end