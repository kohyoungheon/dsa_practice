def unique_paths(m, n)
  row = [1] * n

  (m - 1).times do
    new_row = [1] * n
    (n - 2).downto(0) do |j|
      new_row[j] = new_row[j + 1] + row[j]
    end
    row = new_row
  end

  return row[0]
end

#_________________________________________________________-
