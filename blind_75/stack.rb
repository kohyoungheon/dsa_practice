# time complexity of the provided code is O(n), and the space complexity is O(n).
def is_valid(s)
  return true if s.empty?
  
  stack = []
  s.each_char do |c|
      case c
      when '(', '{', '['
          stack.push(c)
      when ')'
          return false if stack.pop != '('
      when '}'
          return false if stack.pop != '{'
      when ']'
          return false if stack.pop != '['
      end
  end
  return stack.empty?
end