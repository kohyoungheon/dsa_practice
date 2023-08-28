def climb_stairs(n)
  one = 1
  two = 1

  n.times do 
    temp = one
    one = one + two
    two = temp
  end
  one
end
#_________________________________________________--
#nums = [1,2,3,1]
def house_robber(nums)
  rob1 = 0
  rob2 = 0

  nums.each do |n|
    temp = [n + rob1, rob2].max
    rob1 = rob2
    rob2 = temp
  end
  rob2
end

#__________________________________________
def house_robber_2(nums)
  
end