def meeting_rooms(intervals)
  intervals.sort_by! { |i| i[0] }

  (1...intervals.length).each do |i|
    i1 = intervals[i - 1]
    i2 = intervals[i]

    return false if i1[1] > i2[0]
  end

  true
end