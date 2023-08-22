# time complexity of the provided code is O(n), and the space complexity is O(n).
def is_valid(s)
  return true if s.empty?
  
  stack = []
  s.each_char do |c|
      case c
      when '(', '{', '['
          stack.push(c)
      when ')'
          return false unless stack.pop == '('
      when '}'
          return false unless stack.pop == '{'
      when ']'
          return false unless stack.pop == '['
      end
  end
  return stack.empty?
end

#__________________________________________________
class MinStack
    def initialize
      @stack = []
      @min_stack = []
    end
  
    def push(val)
      @stack << val
      if @min_stack.empty?
        @min_stack << val
      else
        val = [val, @min_stack[-1]].min
        @min_stack << val
      end
    end
  
    def pop
      @min_stack.pop
      @stack.pop
    end
  
    def top
      @stack[-1]
    end
  
    def get_min
      @min_stack[-1]
    end
  end