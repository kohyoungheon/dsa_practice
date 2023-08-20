# Input: s1 = "ab", s2 = "eidbaooo"
# Output: true

def check_inclusion(s1, s2)
  return false if s1.length > s2.length

  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  s1.each_char{|char| hash1[char] += 1}
  s2.each_char{|char| hash2[char] += 1}


end

