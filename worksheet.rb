def replace_elements(arr)
  right_max = -1
  (arr.length - 1).downto(0) do |i|
    new_max = [right_max, arr[i]].max
    arr[i] = right_max
    right_max = new_max
  end
  arr
end