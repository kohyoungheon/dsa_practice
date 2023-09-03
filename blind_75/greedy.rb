def max_sub_array(nums)
  res = nums[0]
  total = 0

  nums.each do |n|
    total = 0 if total < 0
    total += n
    res = [res, total].max
  end

  return res
end
#________________________________________
# [2,3,1,1,4]
def can_jump(nums)
  goal = nums.length - 1

  (nums.length - 2).downto(0) do |i|
    if i + nums[i] >= goal
      goal = i
    end
  end

  return goal == 0
end