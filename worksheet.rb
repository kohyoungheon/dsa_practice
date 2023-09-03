def top_k_frequent(nums, k)
  array = Array.new(nums.length + 1){[]}
  count = Hash.new(0)
  nums.each do |num|
    count[num] += 1
  end
  require 'pry'; binding.pry
  
  
  count.each do |key, value|
    array[value] << key
  end

  require 'pry'; binding.pry
  
  result = []

  (array.length - 1).downto(0) do |i|
    result << array[i] unless array[i].empty?
  end
  result.flatten.take(k)
end

top_k_frequent([1,1,1,2,2,3], 2)
